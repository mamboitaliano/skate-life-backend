class Skatepark < ActiveRecord::Base
  has_many :favorites
  has_many :users, :through => :favorites

  validates_presence_of :name
end
