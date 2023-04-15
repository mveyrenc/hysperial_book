# frozen_string_literal: true

class AppFormBuilder < ActionView::Helpers::FormBuilder
  delegate :tag, :safe_join, to: :@template

  include ClassNameHelper

  def input(method, options = {})
    @form_options = options
    object_type = object_type_for_method(method)

    input_type = case object_type
                 when :date then :string
                 when :integer then :string
                 else object_type
                 end

    override_input_type = if options[:as]
                            options[:as]
                          elsif options[:collection]
                            :select
                          end

    send("#{override_input_type || input_type}_input", method, options)
  end

  def button_group(&block)
    tag.div class: "btn-group btn-group-submit my-8 #{object_type}-button-group" do
      block.call
    end
  end

  def submit(value = nil, options = nil)
    super(value, merge_input_options({ class: "btn btn-primary" }, options))
  end

  private

  def form_group(method, options = {}, &block)
    tag.div class: "form-control w-full max-w-screen-lg my-2 #{object_type}-#{method}" do
      safe_join [
                  block.call,
                  hint_text(options[:hint]),
                  error_text(method),
                ].compact
    end
  end

  def field_label(method, options = {})
    unless options[:label] == false
      label(method, merge_label_options({ class: "label" }, options[:label])) do |builder|
        tag.span class: ["label-text font-bold", ("text-error" if builder.object.errors.include?(:cost))] do
          safe_join [
                      builder.translation,
                      " ",
                      (tag.span("*", class: "text-error") if options[:required])
                    ]
        end
      end
    end
  end

  def hint_text(text)
    return if text.nil?
    tag.small text, class: "form-text text-muted"
  end

  def error_text(method)
    return unless has_error?(method)

    tag.div(@object.errors[method].join("<br />").html_safe, class: "invalid-feedback")
  end

  def object_type
    @object.class.name.underscore.to_sym
  end

  def object_type_for_method(method)
    result = if @object.respond_to?(:type_for_attribute) && @object.has_attribute?(method)
               @object.type_for_attribute(method.to_s).try(:type)
             elsif @object.respond_to?(:column_for_attribute) && @object.has_attribute?(method)
               @object.column_for_attribute(method).try(:type)
             end

    result || :string
  end

  def has_error?(method)
    return false unless @object.respond_to?(:errors)
    @object.errors.key?(method)
  end

  # Inputs and helpers

  def string_input(method, options = {})
    form_group(method, options) do
      safe_join [
                  field_label(method, options),
                  string_field(method, merge_input_options({ class: "input input-bordered #{"input-error" if has_error?(method)}" }, options)),
                ]
    end
  end

  def text_input(method, options = {})
    form_group(method, options) do
      safe_join [
                  field_label(method, options),
                  text_area(method, merge_input_options({ class: "textarea textarea-bordered #{"textarea-error" if has_error?(method)}" }, options[:input_html])),
                ]
    end
  end

  def rich_text_area_input(method, options = {})
    form_group(method, options) do
      safe_join [
                  field_label(method, options),
                  rich_text_area(method, merge_input_options({ class: "trix-content #{"input-error" if has_error?(method)}" }, options[:input_html])),
                ]
    end
  end

  def boolean_input(method, options = {})
    form_group(method, options) do
      tag.div(class: "label cursor-pointer") do
        safe_join [
                    label(method, options[:label], class: "label-text"),
                    check_box(method, merge_input_options({ class: "toggle" }, options[:input_html])),
                  ]
      end
    end
  end

  def collection_input(method, options, &block)
    form_group(method, options) do
      safe_join [
                  field_label(method, options),
                  block.call,
                ]
    end
  end

  def select_input(method, options = {})
    value_method = options[:value_method] || :to_s
    text_method = options[:text_method] || :to_s

    collection_input(method, options) do
      collection_select(method, options[:collection], value_method, text_method, options, merge_input_options({ class: "select select-bordered #{"select-error" if has_error?(method)}" }, options[:input_html]))
    end
  end

  def grouped_select_input(method, options = {})
    # We probably need to go back later and adjust this for more customization
    collection_input(method, options) do
      grouped_collection_select(method, options[:collection], :last, :first, :to_s, :to_s, options, merge_input_options({ class: "select select-bordered #{"select-error" if has_error?(method)}" }, options[:input_html]))
    end
  end

  def file_input(method, options = {})
    form_group(method, options) do
      safe_join [
                  field_label(method, options),
                  custom_file_field(method, options),
                ]
    end
  end

  def collection_of(input_type, method, options = {})
    form_builder_method, data_input_class, input_builder_method = case input_type
                                                                  when :radio_buttons then [:collection_radio_buttons, 'radio', :radio_button]
                                                                  when :check_boxes then [:collection_check_boxes, 'checkbox', :check_box]
                                                                  else raise "Invalid input_type for collection_of, valid input_types are \":radio_buttons\", \":check_boxes\""
                                                                  end

    form_group(method, options) do
      safe_join [
                  field_label(method, options),
                  (send(form_builder_method, method, options[:collection], options[:value_method], options[:text_method]) do |b|
                    tag.div(class: "form-control") {
                      b.label(class: "label justify-start cursor-pointer") do
                        safe_join [
                                    b.send(input_builder_method, class: "#{data_input_class} mr-2"),
                                    tag.span(class: "label-text") { b.text },
                                  ]
                      end
                    }
                  end),
                ]
    end
  end

  def radio_buttons_input(method, options = {})
    collection_of(:radio_buttons, method, options)
  end

  def check_boxes_input(method, options = {})
    collection_of(:check_boxes, method, options)
  end

  def string_field(method, options = {})
    case object_type_for_method(method)
    when :date then
      birthday = method.to_s =~ /birth/
      safe_join [
                  date_field(method, merge_input_options(options, { data: { datepicker: true } })),
                  tag.div {
                    date_select(method, {
                      order: [:month, :day, :year],
                      start_year: birthday ? 1900 : Date.today.year - 5,
                      end_year: birthday ? Date.today.year : Date.today.year + 5,
                    }, { data: { date_select: true } })
                  },
                ]
    when :integer then number_field(method, options)
    when :string
      case method.to_s
      when /password/ then password_field(method, options)
      # when /time_zone/ then :time_zone
      # when /country/   then :country
      when /email/ then email_field(method, options)
      when /phone/ then telephone_field(method, options)
      when /url/ then url_field(method, options)
      else
        text_field(method, options)
      end
    end
  end

  def custom_file_field(method, options = {})
    join = []
    if @object.persisted? and @object.has_attribute?(method) and object.attribute(method).attached?
      join << tag.div(class: "input-group-prepend") {
        tag.span("Upload", class: "input-group-text")
      }
    end

    join << tag.div(class: "custom-file") {
      safe_join [
                  file_field(method, options.merge(class: "file-input", data: { controller: "file-input" })),
                ]
    }

    tag.div(class: "input-group") {
      safe_join join
    }
  end

  def merge_label_options(options, user_options)
    return nil if options[:label].nil?
    return options[:label] if user_options[:label].nil?

    options[:label][:class] = class_names(options[:label][:class], user_options[:label][:class] || "")
    user_options[:label].delete(:class)

    options[:label].merge(user_options[:label])
  end

  def merge_input_options(options, user_options)
    return options if user_options.nil?

    user_options.delete(:label)
    user_options.delete(:hint)

    options[:class] = class_names(options[:class], user_options[:class] || "")
    user_options.delete(:class)

    options.merge(user_options)
  end

end
