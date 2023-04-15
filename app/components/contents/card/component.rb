# frozen_string_literal: true

module Contents::Card

  class Component < ApplicationViewComponent
    with_collection_parameter :object

    attr_reader :object

    def initialize(object:)
      @object = object
    end

    private

    def title_color
      object.book.color
    end
  end

end
