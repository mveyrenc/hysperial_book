# frozen_string_literal: true

Rails.application.config.after_initialize do
  # ActionText::ContentHelper.allowed_attributes = Loofah::HTML5::SafeList::ACCEPTABLE_ATTRIBUTES.add('controls')
  # ActionText::ContentHelper.allowed_tags = Loofah::HTML5::SafeList::ACCEPTABLE_ELEMENTS.merge(
  #   %w[quantitative-value recipe-yield]
  # )
end