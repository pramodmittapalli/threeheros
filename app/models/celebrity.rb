class Celebrity < ActiveRecord::Base
  attr_accessible :name, :description

  belongs_to :user

  validates :name, :presence => true, :length => { :maximum => 40 }
  validates :description, :presence => true, :length => { :maximum => 540 }
  validates :user_id, :presence => true

  default_scope :order => 'celebrities.created_at DESC'
end
