# frozen_string_literal: true

# Application helper
module ApplicationHelper
  def nested_dom_id(*args)
    args.map { |arg| arg.respond_to?(:to_key) ? dom_id(arg) : arg }.join('_')
  end

  def model_dom_id(record_or_model)
    (record_or_model.respond_to?(:to_model) ? record_or_model.to_model : record_or_model).model_name.plural
  end

  def name_field(form, multiple: false)
    multiple = false if form.object.persisted?
    return form.text_area :name, autofocus: true, help: t('.name.help') if multiple

    form.text_field :name, autofocus: true
  end

  def alternate_names_field(form)
    form.text_area :alternate_names
  end

  def short_description_field(form)
    form.rich_text_area :short_description
  end

  def description_field(form)
    form.rich_text_area :description
  end

  def position_field(form)
    form.text_field :position
  end
end
