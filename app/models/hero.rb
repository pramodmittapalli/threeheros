class Hero < ActiveRecord::Base
  belongs_to :user
  validates :description, :length => { :maximum => 30 } 
end
