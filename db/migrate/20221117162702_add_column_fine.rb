class AddColumnFine < ActiveRecord::Migration[7.0]
  def change
    add_column :borrow_histories, :fine, :string
  end
end
