class Tracker < ActiveRecord::Base
  belongs_to :user
  
  has_many :trackings

  accepts_nested_attributes_for :trackings, :allow_destroy => true
  
  def fundraisers
    fundraisers = []
    self.trackings.each do |tracking|
      fundraisers << tracking.fundraiser unless tracking.fundraiser.nil?
    end
    return fundraisers
  end
end
