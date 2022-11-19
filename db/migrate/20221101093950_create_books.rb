class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :book_title
      t.string :description
      t.datetime :publish_date

      t.timestamps
    end
  end
end
