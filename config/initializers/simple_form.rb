# frozen_string_literal: true
#
# Uncomment this and change the path if necessary to include your own
# components.
# See https://github.com/heartcombo/simple_form#custom-components to know
# more about custom components.
# Dir[Rails.root.join('lib/components/**/*.rb')].each { |f| require f }
#
# Use this setup block to configure all options available in SimpleForm.
SimpleForm.setup do |config|
  # Wrappers are used by the form builder to generate a
  # complete input. You can remove any component from the
  # wrapper, change the order or even add your own to the
  # stack. The options given below are used to wrap the
  # whole input.

  # Default class to be used on all forms
  config.default_form_class = "form-vertical"

  # Default class for buttons
  config.button_class = 'btn'

  # Define the default class of the input wrapper of the boolean input.
  config.boolean_label_class = 'cursor-pointer label'

  # How the label text should be generated altogether with the required text.
  config.label_text = lambda { |label, required, explicit_label| "#{label} #{required}" }

  # Define the way to render check boxes / radio buttons with labels.
  config.boolean_style = :inline

  # You can wrap each item in a collection of radio/check boxes with a tag
  config.item_wrapper_tag = :div

  # Defines if the default input wrapper class should be included in radio
  # collection wrappers.
  config.include_default_input_wrapper_class = false

  # CSS class to add for error notification helper.
  config.error_notification_class = 'alert shadow-lg alert-error'

  # Method used to tidy up errors. Specify any Rails Array method.
  # :first lists the first message for each field.
  # :to_sentence to list all errors for each field.
  config.error_method = :to_sentence

  # add validation classes to `input_field`
  config.input_field_error_class = 'form-input-success'
  config.input_field_valid_class = 'form-input-error'

  # add label class
  config.label_class = 'label-text'

  # add input class
  config.input_class = 'input input-bordered w-full'

  # default wrapper
  config.wrappers :tailwind_form, tag: 'div', class: 'form-control', error_class: 'form-control-invalid', valid_class: 'form-control-valid' do |b|
    b.use :html5
    b.use :placeholder
    b.optional :maxlength
    b.optional :minlength
    b.optional :pattern
    b.optional :min_max
    b.optional :readonly
    b.wrapper tag: 'label', class: 'label' do |l|
      l.use :label, tag: 'span'
    end
    b.use :input, class: 'form-input w-full', error_class: 'form-input-error', valid_class: 'form-input-success'
    b.use :full_error, wrap_with: { tag: 'div', class: 'form-invalid-feedback' }
    b.use :hint, wrap_with: { tag: 'small', class: 'form-hint' }
  end

  # input for boolean
  config.wrappers :tailwind_boolean, tag: 'fieldset', class: 'form-control', error_class: 'form-control-invalid', valid_class: 'form-control-valid' do |b|
    b.use :html5
    b.optional :readonly
    b.wrapper :form_check_wrapper, tag: 'div', class: 'form-check' do |bb|
      bb.use :input, class: 'form-check-input', error_class: 'form-input-error', valid_class: 'form-input-success'
      bb.use :label, class: 'form-check-label'
      bb.use :full_error, wrap_with: { tag: 'div', class: 'form-invalid-feedback' }
      bb.use :hint, wrap_with: { tag: 'small', class: 'form-text text-muted' }
    end
  end

  # input for radio buttons and check boxes
  config.wrappers :tailwind_collection, item_wrapper_class: 'form-check', item_label_class: 'form-check-label', tag: 'fieldset', class: 'form-control', error_class: 'form-control-invalid', valid_class: 'form-control-valid' do |b|
    b.use :html5
    b.optional :readonly
    b.wrapper tag: 'label', class: 'label' do |l|
      l.use :label, tag: 'span'
    end
    b.wrapper :legend_tag, tag: 'legend', class: 'col-form-label pt-0' do |ba|
      ba.use :label_text
    end
    b.use :input, class: 'form-check-input', error_class: 'form-input-error', valid_class: 'form-input-success'
    b.use :full_error, wrap_with: { tag: 'div', class: 'invalid-feedback d-block' }
    b.use :hint, wrap_with: { tag: 'small', class: 'form-text text-muted' }
  end

  # input for inline radio buttons and check boxes
  config.wrappers :tailwind_collection_inline, item_wrapper_class: 'form-check form-check-inline', item_label_class: 'form-check-label', tag: 'fieldset', class: 'form-control', error_class: 'form-control-invalid', valid_class: 'form-control-valid' do |b|
    b.use :html5
    b.optional :readonly
    b.wrapper :legend_tag, tag: 'legend', class: 'col-form-label pt-0' do |ba|
      ba.use :label_text
    end
    b.use :input, class: 'form-check-input', error_class: 'form-input-error', valid_class: 'form-input-success'
    b.use :full_error, wrap_with: { tag: 'div', class: 'invalid-feedback d-block' }
    b.use :hint, wrap_with: { tag: 'small', class: 'form-text text-muted' }
  end

  # file input
  config.wrappers :tailwind_file, tag: 'div', class: 'form-control', error_class: 'form-control-invalid', valid_class: 'form-control-valid' do |b|
    b.use :html5
    b.use :placeholder
    b.optional :maxlength
    b.optional :minlength
    b.optional :readonly
    b.wrapper tag: 'label', class: 'label' do |l|
      l.use :label, tag: 'span'
    end
    b.use :input, class: 'form-control-file', error_class: 'form-input-error', valid_class: 'form-input-success'
    b.use :full_error, wrap_with: { tag: 'div', class: 'form-invalid-feedback' }
    b.use :hint, wrap_with: { tag: 'small', class: 'form-text text-muted' }
  end

  # select input
  config.wrappers :tailwind_select, tag: 'div', class: 'form-control', error_class: 'form-control-invalid', valid_class: 'form-control-valid' do |b|
    b.use :html5
    b.optional :readonly
    b.wrapper tag: 'label', class: 'label' do |l|
      l.use :label, tag: 'span'
    end
    b.use :input, class: 'select select-bordered w-full max-w-xs', error_class: 'form-input-error', valid_class: 'form-input-success'
    b.use :full_error, wrap_with: { tag: 'div', class: 'invalid-feedback d-block' }
    b.use :hint, wrap_with: { tag: 'small', class: 'form-text text-muted' }
  end

  # multi select input
  config.wrappers :tailwind_multi_select, tag: 'div', class: 'form-control', error_class: 'form-control-invalid', valid_class: 'form-control-valid' do |b|
    b.use :html5
    b.optional :readonly
    b.wrapper tag: 'label', class: 'label' do |l|
      l.use :label, tag: 'span'
    end
    b.wrapper tag: 'div', class: 'd-flex flex-row justify-content-between align-items-center' do |ba|
      ba.use :input, class: 'form-control mx-1', error_class: 'form-input-error', valid_class: 'form-input-success'
    end
    b.use :full_error, wrap_with: { tag: 'div', class: 'invalid-feedback d-block' }
    b.use :hint, wrap_with: { tag: 'small', class: 'form-text text-muted' }
  end

  # vertical range input
  config.wrappers :tailwind_range, tag: 'div', class: 'form-control', error_class: 'form-control-invalid', valid_class: 'form-control-valid' do |b|
    b.use :html5
    b.use :placeholder
    b.optional :readonly
    b.optional :step
    b.wrapper tag: 'label', class: 'label' do |l|
      l.use :label, tag: 'span'
    end
    b.use :input, class: 'form-control-range', error_class: 'form-input-error', valid_class: 'form-input-success'
    b.use :full_error, wrap_with: { tag: 'div', class: 'invalid-feedback d-block' }
    b.use :hint, wrap_with: { tag: 'small', class: 'form-text text-muted' }
  end

  # texte textarea
  config.wrappers :tailwind_textarea, tag: 'div', class: 'form-control', error_class: 'form-control-invalid', valid_class: 'form-control-valid' do |b|
    b.use :html5
    b.use :placeholder
    b.optional :maxlength
    b.optional :minlength
    b.optional :pattern
    b.optional :min_max
    b.optional :readonly
    b.wrapper tag: 'label', class: 'label' do |l|
      l.use :label, tag: 'span'
    end
    b.use :input, class: 'form-textarea w-full', error_class: 'form-input-error', valid_class: 'form-input-success'
    b.use :full_error, wrap_with: { tag: 'div', class: 'form-invalid-feedback' }
    b.use :hint, wrap_with: { tag: 'small', class: 'form-text text-muted' }
  end

  # rich text area
  config.wrappers :tailwind_rich_text_area, tag: 'div', class: 'form-control', error_class: 'form-control-invalid', valid_class: 'form-control-valid' do |b|
    b.use :html5
    b.use :placeholder
    b.optional :maxlength
    b.optional :minlength
    b.optional :pattern
    b.optional :min_max
    b.optional :readonly
    b.wrapper tag: 'label', class: 'label' do |l|
      l.use :label, tag: 'span'
    end
    b.wrapper tag: 'div', class: 'form-rich-text-area w-full trix-editor' do |i|
      i.use :input, class: 'trix-content', error_class: 'form-input-error', valid_class: 'form-input-success', contenteditable: true
    end
    b.use :full_error, wrap_with: { tag: 'div', class: 'form-invalid-feedback' }
    b.use :hint, wrap_with: { tag: 'small', class: 'form-text text-muted' }
  end

  # markdown input
  # config.wrappers :tailwind_markdown, tag: 'div', class: 'form-control', error_class: 'form-control-invalid', valid_class: 'form-control-valid' do |b|
  #   b.use :html5
  #   b.use :placeholder
  #   b.optional :maxlength
  #   b.optional :minlength
  #   b.optional :pattern
  #   b.optional :min_max
  #   b.optional :readonly
  #   b.wrapper tag: 'label', class: 'label' do |l|
  #     l.use :label, tag: 'span'
  #   end
  #   b.wrapper tag: 'div', html: { data: { controller: 'fields--simple-mde' } } do |i|
  #     i.use :input, class: 'form-markdown w-full', error_class: 'form-input-error', valid_class: 'form-input-success',
  #           data: { fields__simple_mde_target: 'element' }
  #   end
  #   b.use :full_error, wrap_with: { tag: 'div', class: 'form-invalid-feedback' }
  #   b.use :hint, wrap_with: { tag: 'small', class: 'form-text text-muted' }
  # end

  # ckeditor input
  # config.wrappers :tailwind_ckeditor, tag: 'div', class: 'form-control', error_class: 'form-control-invalid', valid_class: 'form-control-valid' do |b|
  #   b.use :html5
  #   b.use :placeholder
  #   b.optional :maxlength
  #   b.optional :minlength
  #   b.optional :pattern
  #   b.optional :min_max
  #   b.optional :readonly
  #   b.wrapper tag: 'label', class: 'label' do |l|
  #     l.use :label, tag: 'span'
  #   end
  #   b.wrapper tag: 'div', html: { data: { controller: 'fields--ckeditor' } } do |i|
  #     i.use :input, class: 'form-ckeditor w-full', error_class: 'form-input-error', valid_class: 'form-input-success',
  #           data: { fields__ckeditor_target: 'element' }
  #   end
  #   b.use :full_error, wrap_with: { tag: 'div', class: 'form-invalid-feedback' }
  #   b.use :hint, wrap_with: { tag: 'small', class: 'form-text text-muted' }
  # end

  # The default wrapper to be used by the FormBuilder.
  config.default_wrapper = :tailwind_form

  # Custom wrappers for input types. This should be a hash containing an input
  # type as key and the wrapper that will be used for all inputs with specified type.
  config.wrapper_mappings = {
    boolean: :tailwind_boolean,
    check_boxes: :tailwind_collection,
    date: :tailwind_multi_select,
    datetime: :tailwind_multi_select,
    file: :tailwind_file,
    radio_buttons: :tailwind_collection,
    range: :tailwind_range,
    select: :tailwind_select,
    time: :tailwind_multi_select,
    text: :tailwind_textarea,
    rich_text_area: :tailwind_rich_text_area,
    # markdown: :tailwind_markdown,
    # ckeditor: :tailwind_ckeditor,
  }

end
