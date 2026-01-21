# frozen_string_literal: true

# Books controller
module Books
  # Books controller
  class BooksController < ApplicationController
    include IndexSearchActionsConcern
    include NewCreateActionsConcern
    include EditUpdateActionsConcern
    include DestroyActionConcern

    private

    def model
      Book
    end

    def redirect_to_after_create
      books_path
    end

    def redirect_to_after_update
      books_path
    end

    def redirect_to_after_destroy
      books_path
    end

    def strong_params
      params
        .require(:book)
        .permit(
          :alternate_names,
          :description,
          :kind,
          :name,
          :position
        )
    end
  end
end
