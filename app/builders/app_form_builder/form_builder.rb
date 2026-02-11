# frozen_string_literal: true

module AppFormBuilder
  # FormBuilder
  class FormBuilder < ActionView::Helpers::FormBuilder
    attr_reader :layout

    include AppFormBuilder::Components

    include AppFormBuilder::FormHelpers::FormFieldBuilder
    include AppFormBuilder::FormHelpers::FormField
    include AppFormBuilder::FormHelpers::Helpers
    include AppFormBuilder::FormHelpers::Base
    include AppFormBuilder::FormHelpers::Button
    include AppFormBuilder::FormHelpers::CheckBox
    include AppFormBuilder::FormHelpers::CollectionCheckBoxes
    include AppFormBuilder::FormHelpers::CollectionRadioButtons
    include AppFormBuilder::FormHelpers::CollectionSelect
    include AppFormBuilder::FormHelpers::DateField
    include AppFormBuilder::FormHelpers::EmailField
    include AppFormBuilder::FormHelpers::FileField
    include AppFormBuilder::FormHelpers::GroupedCollectionSelect
    include AppFormBuilder::FormHelpers::ImageField
    include AppFormBuilder::FormHelpers::Label
    include AppFormBuilder::FormHelpers::RichTextArea
    include AppFormBuilder::FormHelpers::MonthField
    include AppFormBuilder::FormHelpers::NumberField
    include AppFormBuilder::FormHelpers::PasswordField
    include AppFormBuilder::FormHelpers::RadioButton
    include AppFormBuilder::FormHelpers::Select
    include AppFormBuilder::FormHelpers::Submit
    include AppFormBuilder::FormHelpers::TextArea
    include AppFormBuilder::FormHelpers::TextField
    include AppFormBuilder::FormHelpers::TimeField
    include AppFormBuilder::FormHelpers::UrlField

    def initialize(object_name, object, template, options)
      @layout = options[:layout]
      super
    end
  end
end
