class AddColumnForDatatypes < ActiveRecord::Migration[7.0]
  def change
    add_column :borrow_histories, :publish_date, :datetime
  end
end
