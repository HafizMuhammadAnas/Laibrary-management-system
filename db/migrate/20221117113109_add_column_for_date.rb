class AddColumnForDate < ActiveRecord::Migration[7.0]
  def change
    add_column :borrow_histories, :starts_at_time_of_day, :datetime

  end
end
