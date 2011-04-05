class FundraiserController < ApplicationController
  def show
    @fundraiser = Fundraiser.find(params[:profile_name], params[:fundraiser_name])
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @fundraiser }
    end
  end

end
