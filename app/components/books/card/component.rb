# frozen_string_literal: true

module Books::Card

  class Component < Books::BookViewComponent

    with_collection_parameter :object

    attr_reader :object

    def initialize(object:)
      @object = object
    end

    private

    def title_color
      if object.color.blank?
        "inherit"
      else
        "#{object.color}"
      end
    end

  end

end
