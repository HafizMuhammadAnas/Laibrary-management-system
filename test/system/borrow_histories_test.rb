require "application_system_test_case"

class BorrowHistoriesTest < ApplicationSystemTestCase
  setup do
    @borrow_history = borrow_histories(:one)
  end

  test "visiting the index" do
    visit borrow_histories_url
    assert_selector "h1", text: "Borrow histories"
  end

  test "should create borrow history" do
    visit borrow_histories_url
    click_on "New borrow history"

    click_on "Create Borrow history"

    assert_text "Borrow history was successfully created"
    click_on "Back"
  end

  test "should update Borrow history" do
    visit borrow_history_url(@borrow_history)
    click_on "Edit this borrow history", match: :first

    click_on "Update Borrow history"

    assert_text "Borrow history was successfully updated"
    click_on "Back"
  end

  test "should destroy Borrow history" do
    visit borrow_history_url(@borrow_history)
    click_on "Destroy this borrow history", match: :first

    assert_text "Borrow history was successfully destroyed"
  end
end
