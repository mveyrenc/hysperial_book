# frozen_string_literal: true

module BooksHelper
  def book_collection_select(form)
    book_collection = form.object.persisted? ? [form.object.book] : Bookcase::Book.order(:position)
    form.collection_select :book_id, book_collection, :id, :name, {}, { disabled: form.object.persisted? }
  end
end
