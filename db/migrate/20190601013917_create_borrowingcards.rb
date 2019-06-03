class CreateBorrowingcards < ActiveRecord::Migration[5.1]
  def change
    create_table :borrowingcards do |t|
      t.integer :borrower_id
      t.integer :book_id

      t.timestamps
    end
  end
end
