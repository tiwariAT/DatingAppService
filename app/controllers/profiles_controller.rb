class ProfilesController < ApplicationController
  def new
  	@profile = Profile.new
  end

  def index
    @profiles = Profile.all
    if params[:search]
      @profile = Profile.search(params.slice(:search, :country))
    else
      @profile = Profile.all.order('created_at DESC')
    end
  end

  
  def show
  	@profile = Profile.find_by(params[:id])
  end

  def create
  	@profile = Profile.create(profile_params)
  	if @profile
  		redirect_to profiles_path
  	else
  		render 'new'
  	end
  end

  private
  def profile_params
  	params.require(:profile).permit(:gender,:state,:country,:address, :avatar)
  end
end
