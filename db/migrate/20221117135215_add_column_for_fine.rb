class AddColumnForFine < ActiveRecord::Migration[7.0]
  def change
    add_column :borrow_histories, :due_date, :datetime
  end
end
