# frozen_string_literal: true

class ContentAttributeKind
  extend ActiveModel::Translation

  AVAILABLE_KINDS = {
    headline: {
      description: '',
      data_type: :text,
      available_for: %i[article tutorial ingredient recipe menu pattern]
    },
    article_body: {
      description: '',
      data_type: :text,
      available_for: %i[article tutorial ingredient recipe menu pattern]
    },
    total_time: {
      description: 'The total time required to perform instructions or a direction (including time to prepare the supplies)',
      data_type: :duration,
      available_for: %i[tutorial recipe]
    },
    difficulty: {
      description: 'The level of difficulty to perform instructions or a direction',
      data_type: :rate,
      available_for: %i[tutorial recipe]
    },
    supply: {
      description: 'A supply consumed when performing instructions or a direction',
      data_type: :how_to_supply,
      available_for: %i[tutorial recipe]
    },
    tool: {
      description: 'An object used (but not consumed) when performing instructions or a direction',
      data_type: :how_to_tool,
      available_for: %i[tutorial recipe]
    },
    ingredients: {
      description: 'An ingredient or ordered list of ingredients and potentially quantities used in the recipe, e.g. 1 cup of sugar, flour or garlic',
      data_type: :item_list,
      available_for: %i[tutorial recipe]
    },
    prep_time: {
      description: 'The length of time it takes to prepare the items to be used in instructions or a direction',
      data_type: :duration,
      available_for: %i[tutorial recipe]
    },
    perform_time: {
      description: 'The length of time it takes to perform instructions or a direction (not including time to prepare the supplies)',
      data_type: :duration,
      available_for: %i[tutorial recipe]
    },
    cook_time: {
      description: 'The time it takes to actually cook the dish',
      data_type: :duration,
      available_for: [:recipe]
    },
    instructions: {
      description: 'A step in making the recipe, in the form of a single item (document, video, etc.) or an ordered list with HowToStep and/or HowToSection items',
      data_type: :item_list,
      available_for: %i[tutorial recipe]
    },
    yield: {
      description: 'The quantity that results by performing instructions (for example, number of people served, number of servings, etc)',
      data_type: :quantitative_value,
      available_for: %i[tutorial]
    },
    recipe_yield: {
      description: 'The quantity produced by the recipe (for example, number of people served, number of servings, etc)',
      data_type: :quantitative_value,
      available_for: %i[recipe]
    },
    estimated_cost: {
      description: 'The estimated cost of the supply or supplies consumed when performing instructions',
      data_type: :monetary_value,
      available_for: %i[tutorial recipe]
    },
    is_based_on: {
      description: 'A resource from which this work is derived or from which it is a modification or adaptation',
      data_type: :reference,
      available_for: %i[tutorial recipe]
    },
    video: {
      description: 'An embedded video object',
      data_type: :video_object,
      available_for: %i[tutorial recipe]
    },
    wine: {
      description: 'Suggested wine to accompany a recipe',
      data_type: :text,
      available_for: [:recipe]
    }
  }.freeze

  # https://schema.org/Recipe
  #  KINDS = %w[text integer number url boolean date duration video_object duration item_list how_to_supply how_to_tool how_to_section
  # how_to_step how_to_direction how_to_tip property_value quantitative_value monetary_amount rating location reference].freeze

  def initialize(kind)
    @kind = kind
  end

  def self.kinds
    AVAILABLE_KINDS.keys.index_by(&:to_sym).to_h
  end

  def self.data_type(kind)
    raise('attribute kind %s unknown' % kind) unless AVAILABLE_KINDS.key? kind.to_sym

    AVAILABLE_KINDS[kind.to_sym][:data_type]
  end
end
