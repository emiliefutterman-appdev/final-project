# == Schema Information
#
# Table name: borrowingcards
#
#  id          :integer          not null, primary key
#  borrower_id :integer
#  book_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Borrowingcard < ApplicationRecord
    
    belongs_to :borrower, :class_name => "User"

    belongs_to :book

    def book_title
        book = Book.where({ :id => book_id })
        return book.pluck(:title)
    end
    
    def book_cover
        book = Book.where({ :id => book_id })
        return book.pluck(:cover).first
    end
    
    
end
