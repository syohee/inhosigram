class ProfilesController < ApplicationController
  before_action :prevention, only: [:edit]
  before_action :set_profile, only: [:edit, :update]
  
  def show
    redirect_to user_path
  end
  
  def edit
  end
  
  def update
    if @profile.update(profile_params)
      redirect_to user_path
    else
      render 'edit'
    end
  end
  
  private
  
  def profile_params
    params.require(:profile).permit(:image, :image_cache)
  end
  
  def set_profile
    @profile = User.find(current_user.id).profile
  end
  
  def prevention
    set_profile
    unless @profile.user_id == current_user.id
      redirect_to user_path
    end
  end
end
