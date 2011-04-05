class FundraiserController < ApplicationController
  def show
    @fundraiser = Fundraiser.find(params[:profile_name], params[:fundraiser_name])
  end

end
