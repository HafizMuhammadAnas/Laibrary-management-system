class AddRool < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :rool , :string
  end
end
