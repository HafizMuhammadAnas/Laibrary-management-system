class AddColumnForDatatypes < ActiveRecord::Migration[7.0]
  def change
    change_column :borrow_histories, :publish_date, :datetime
  end
end
