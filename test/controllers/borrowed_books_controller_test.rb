require "test_helper"

class BorrowedBooksControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get borrowed_books_index_url
    assert_response :success
  end
end
