class Favorite < ActiveRecord::Base
  belongs_to :user
  belongs_to :skatepark

  validates_uniqueness_of :user_id, :scope => :skatepark_id
end
