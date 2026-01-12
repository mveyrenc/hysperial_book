# frozen_string_literal: true

class ApplicationInteractor
  include Interactor

  def translate(key, **options)
    if key&.start_with?(".")
      mdl = self.class.name.deconstantize.underscore.tr("/", ".")
      clss = self.class.name.demodulize.underscore.tr("/", ".")
      defaults = [:"#{mdl}#{key}"]
      defaults << options[:default] if options[:default]
      options[:default] = defaults.flatten
      key = "#{mdl}.#{clss}#{key}"
    end

    if options[:default] && ActiveSupport::HtmlSafeTranslation.html_safe_translation_key?(key)
      options[:default] = Array(options[:default]).map do |value|
        value.is_a?(String) ? ERB::Util.html_escape(value) : value
      end
    end

    ActiveSupport::HtmlSafeTranslation.translate(key, **options)
  end
  alias :t :translate

  def localize(object, **options)
    I18n.localize(object, **options)
  end
  alias :l :localize
end
