class Trip < ActiveRecord::Base 
  validates_presence_of :location, :description

  belongs_to :user
end 
