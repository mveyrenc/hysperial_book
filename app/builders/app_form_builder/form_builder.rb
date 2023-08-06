# frozen_string_literal: true

module AppFormBuilder
  class FormBuilder < ActionView::Helpers::FormBuilder
    attr_reader :layout

    include AppFormBuilder::FormFieldBuilder
    include AppFormBuilder::FormField
    include AppFormBuilder::Components

    include AppFormBuilder::Helpers

    include AppFormBuilder::Inputs::Base
    include AppFormBuilder::Inputs::EmailField
    include AppFormBuilder::Inputs::UrlField
    include AppFormBuilder::Inputs::DateField
    include AppFormBuilder::Inputs::TimeField
    include AppFormBuilder::Inputs::MonthField
    include AppFormBuilder::Inputs::NumberField
    include AppFormBuilder::Inputs::PasswordField
    include AppFormBuilder::Inputs::Select
    include AppFormBuilder::Inputs::TextField
    include AppFormBuilder::Inputs::TextArea
    include AppFormBuilder::Inputs::CheckBox
    include AppFormBuilder::Inputs::CollectionCheckBoxes
    include AppFormBuilder::Inputs::CollectionRadioButtons
    include AppFormBuilder::Inputs::CollectionSelect

    delegate :content_tag, :capture, :concat, :tag, to: :@template

    def initialize(object_name, object, template, options)
      @layout = options[:layout]
      super
    end
  end
end
