class AddColumnToBorrowHistory < ActiveRecord::Migration[7.0]
  def change
    add_column :borrow_histories, :book_id, :integer, null: false, foreign_key: true
    add_column :borrow_histories, :user_id, :integer, null: false, foreign_key: true


  end
end
