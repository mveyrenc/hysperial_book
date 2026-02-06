# frozen_string_literal: true

module BooksHelper

  def book_collection_select(f)
    book_collection = f.object.persisted? ? [f.object.book] : Bookcase::Book.order(:position)
    f.collection_select :book_id, book_collection, :id, :name, {}, { disabled: f.object.persisted? }
  end
end
