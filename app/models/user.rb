class User < ActiveRecord::Base
  has_many :favorites
  has_many :skateparks, :through => :favorites

  validates_presence_of :name
  
end
