# frozen_string_literal: true

module Shared::EditButton

  class Component < ApplicationViewComponent

    param :object

    def call
      path = nil
      case object.class.name
      when Book.name
        path = edit_book_path(object)
      when ContentArticle.name
        path = edit_content_article_path(object)
      when ContentRecipe.name
        path = edit_content_recipe_path(object)
      when ContentTutorial.name
        path = edit_content_tutorial_path(object)
      else
        puts object.class
      end
      link_to I18n.t(virtual_path + '.name'), path, class: "btn btn-xs btn-secondary" unless path.nil?
    end
  end

end
