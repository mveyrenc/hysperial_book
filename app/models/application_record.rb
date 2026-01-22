# frozen_string_literal: true

# Application record
class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  ## Searchkick
  # no search

  ## FriendlyId
  # no friendly id

  ## Enumerable
  # no enumerable

  ## Relations
  # no relation

  ## Position
  # no position

  ## Attributes cleaning
  strip_attributes

  ## Validations
  # no validation

  ## Callbacks
  # no callback

  ## Conversion Methods
  before_validation :sanitize_attributes

  ## Default values
  # no default value

  protected

  SANITIZE_ATTRIBUTES_CONFIG = {
    name: Sanitize::Config::DEFAULT,
    alternate_names: Sanitize::Config::DEFAULT,
    short_description: Sanitize::Config::RESTRICTED,
    description: Sanitize::Config::RESTRICTED,
    plain_text: Sanitize::Config::DEFAULT,
    markdown_text: Sanitize::Config::DEFAULT,
    html_text: Sanitize::Config.merge(Sanitize::Config::BASIC,
                                      elements: Sanitize::Config::BASIC[:elements] + %w[div table]
    ),
  }

  def sanitize_attributes
    SANITIZE_ATTRIBUTES_CONFIG.each do |a, s|
      next unless self.has_attribute?(a) && self.attribute_present?(a)
      v = self.fetch_attribute(a)
      self.write_attribute(a, Sanitize.fragment(v, s))
    end
  end

end
