# == Schema Information
#
# Table name: books
#
#  id         :integer          not null, primary key
#  title      :text
#  author     :text
#  cover      :string
#  amazon     :text
#  donator_id :integer
#  borrowed   :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Book < ApplicationRecord
    belongs_to :donator, :class_name => "User"
    
    has_one :borrowingcard, :dependent => :destroy
   
    def donator
       donator = self.donator_id
       donator_id =  User.where({ :id => donator })
       return donator_id.pluck(:email)
    end

    
end
