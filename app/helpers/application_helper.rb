# frozen_string_literal: true

module ApplicationHelper

  include OptionHelper

  def app_form_for(name, *args, &block)
    options = args.extract_options!
    options[:html] = prepend_option(options[:html], :class, "container mx-auto")
    args << options.merge(builder: AppFormBuilder)
    form_for(name, *args, &block)
  end

  def app_form_with(model: nil, scope: nil, url: nil, format: nil, **options, &block)
    options = options.reverse_merge(builder: AppFormBuilder)
    options[:html] = prepend_option(options[:html], :class, "container mx-auto")
    form_with(model: model, scope: scope, url: url, format: format, **options, &block)
  end

end
