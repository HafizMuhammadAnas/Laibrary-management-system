class AddColumnToBorrowHis < ActiveRecord::Migration[7.0]
  def change
    add_column :borrow_histories, :book_title , :string
    add_column :borrow_histories, :publish_date  , :string


  end
end
