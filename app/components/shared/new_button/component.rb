# frozen_string_literal: true

module Shared::NewButton

  class Component < ApplicationViewComponent

    param :type

    def call
      path = nil
      case type.name
      when Book.name
        path = new_book_path
      when ContentArticle.name
        path = new_content_article_path
      when ContentRecipe.name
        path = new_content_recipe_path
      when ContentSoapRecipe.name
        path = new_content_soap_recipe_path
      when ContentTutorial.name
        path = new_content_tutorial_path
      else
        puts object.class
      end

      link_to I18n.t("#{virtual_path}.#{type.name.underscore}"), path, class: "btn btn-md btn-secondary" unless path.nil?
    end
  end

end
