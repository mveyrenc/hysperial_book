class RichTextAreaInput < Formtastic::Inputs::TextInput
  def input_html_options
    super.merge(:class => "trix-editor")
  end
end
