# frozen_string_literal: true

class ApplicationSearchResultsDecorator
  include Enumerable
  include Draper::ViewHelpers
  extend Draper::Delegation

  delegate :current_page, :total_pages, :limit_value, :entry_name, :total_count, :offset_value, :last_page?
  # delegate :any?, :each, to: :decorated_collection

  # @return the collection being decorated.
  attr_reader :object
  private :object

  # @return [Class] the decorator class used to decorate each item, as set by
  #   {#initialize}.
  attr_reader :decorator_class
  private :decorator_class

  # @return [Hash] extra data to be used in user-defined methods, and passed
  #   to each item's decorator.
  attr_reader :context
  private :context

  # array_methods = Array.instance_methods - Object.instance_methods
  # delegate :==, :as_json, *array_methods, to: :decorated_collection

  # @param object Searchkick::Results
  #   collection to decorate.
  # @option options [Class, nil] :with (nil)
  #   the decorator class used to decorate each item. When `nil`, each item's
  #   {Decoratable#decorate decorate} method will be used.
  # @option options [Hash] :context ({})
  #   extra data to be stored in the collection decorator and used in
  #   user-defined methods, and passed to each item's decorator.
  def initialize(object, options = {})
    options.assert_valid_keys(:with, :context)
    @object = object
    @decorator_class = options[:with]
    @context = options.fetch(:context, {})
  end

  class << self
    alias decorate new
  end

  # @return [Array] the decorated items.
  def decorated_collection
    @decorated_collection ||= object.with_highlights.map { |record, highlights| decorate_item(record, highlights) }
  end

  delegate :find, to: :decorated_collection

  def each(&)
    decorated_collection.each(&)
  end

  def to_s
    "#<#{self.class.name} of #{decorator_class || 'inferred decorators'} for #{object.inspect}>"
  end

  def context=(value)
    @context = value
    each { |item| item.context = value } if @decorated_collection
  end

  # @return [true]
  def decorated?
    true
  end

  alias decorated_with? instance_of?

  def kind_of?(klass)
    decorated_collection.is_a?(klass) || super
  end

  alias is_a? kind_of?

  def replace(other)
    decorated_collection.replace(other)
    self
  end

  protected

  # Decorates the given item.
  def decorate_item(item, highlights)
    item_decorator.call(item, context: context.merge(highlights: highlights))
  end

  private

  def item_decorator
    if decorator_class
      decorator_class.method(:decorate)
    else
      ->(item, options) { item.decorate(options) }
    end
  end
end
