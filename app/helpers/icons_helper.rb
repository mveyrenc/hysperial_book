# frozen_string_literal: true

module IconsHelper
  def gluten_free_icon
    tag.span(class: %w[icons-stack]) do
      gluten_icon + free_icon
    end
  end

  def gluten_icon
    tag.span(class: %w[icon is-stack-1]) do
      tag.span('wheat', class: %w[material-symbols])
    end
  end

  def egg_free_icon
    tag.span(class: %w[icons-stack]) do
      egg_icon + free_icon
    end
  end

  def egg_icon
    tag.span(class: %w[icon is-stack-1]) do
      tag.span('egg_alt', class: %w[material-symbols])
    end
  end

  def allergy_free_icon
    tag.span(class: %w[icons-stack]) do
      allergy_icon + free_icon
    end
  end

  def allergy_icon
    tag.span(class: %w[icon is-stack-1]) do
      tag.span('allergy', class: %w[material-symbols])
    end
  end

  def without_bake_icon
    tag.span(class: %w[icons-stack]) do
      bake_icon + without_icon
    end
  end

  def bake_icon
    tag.span(class: %w[icon is-stack-1]) do
      tag.span('mode_heat', class: %w[material-symbols])
    end
  end

  def without_icon
    tag.span(class: %w[icon is-stack-2 has-text-grey]) do
      tag.span('block', class: %w[material-symbols])
    end
  end

  def free_icon
    tag.span(class: %w[icon is-stack-2 has-text-danger]) do
      tag.span('block', class: %w[material-symbols])
    end
  end
end
