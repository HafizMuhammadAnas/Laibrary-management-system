class CreateBorrowHistories < ActiveRecord::Migration[7.0]
  def change
    create_table :borrow_histories do |t|

      t.timestamps
    end
  end
end
