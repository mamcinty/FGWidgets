class Tracking < ActiveRecord::Base
  belongs_to :tracker
  
  def fundraiser
    Fundraiser.find_by_url(self.url)
  end
end
