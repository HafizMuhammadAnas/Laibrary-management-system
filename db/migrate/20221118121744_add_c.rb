class AddC < ActiveRecord::Migration[7.0]
  def change
    add_column :borrow_histories, :username, :string 

  end
end
