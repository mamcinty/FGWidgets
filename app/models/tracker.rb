class Tracker < ActiveRecord::Base
  belongs_to :user
  
  has_many :trackings

  accepts_nested_attributes_for :trackings, :allow_destroy => true
end
