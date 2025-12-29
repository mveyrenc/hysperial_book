# frozen_string_literal: true

setup do
  @record = books(:one)

  Book.__elasticsearch__.import force: true
  Book.__elasticsearch__.refresh_index!
end

test 'should get search results' do
  get search_books_url(q: 'mystring')
  assert_response :success
  assert_not_nil assigns(:books)
  assert_equal 2, assigns(:books).size
end
