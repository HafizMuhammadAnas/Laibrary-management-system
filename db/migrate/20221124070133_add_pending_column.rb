class AddPendingColumn < ActiveRecord::Migration[7.0]
  def change
    add_column :borrow_histories, :status, :string
  end
end
