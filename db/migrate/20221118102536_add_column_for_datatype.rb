class AddColumnForDatatype < ActiveRecord::Migration[7.0]
  def change
    change_column :borrow_histories, :due_date, :datetime
  end
end
