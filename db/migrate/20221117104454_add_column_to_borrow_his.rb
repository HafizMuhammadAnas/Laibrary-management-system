class AddColumnToBorrowHis < ActiveRecord::Migration[7.0]
  def change
    add_column :borrow_histories, :book_title , :string
  end
end
