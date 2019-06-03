class CreateBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :books do |t|
      t.text :title
      t.text :author
      t.string :cover
      t.text :amazon
      t.integer :donator_id
      t.boolean :borrowed

      t.timestamps
    end
  end
end
