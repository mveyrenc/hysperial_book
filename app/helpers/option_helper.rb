# frozen_string_literal: true
module OptionHelper

  def prepend_option(options, key, value)
    options = {} if options.nil?
    options[key] = [value, options[key]].compact.join(" ")
    options
  end

  def append_option(options, key, value)
    options = {} if options.nil?
    options[key] = [options[key], value].compact.join(" ")
    options
  end

end
