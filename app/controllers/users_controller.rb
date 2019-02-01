class UsersController < ApplicationController
  before_action :set_user, only: [:show, :destroy]
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save

      @profile = Profile.create!(user_id: @user.id)
      @profile.image = Rails.root.join('app', 'assets', 'images', 'profile_default.jpg').open
      @profile.save!
      
      redirect_to new_session_path
    else
      render 'new'
    end
  end
  
  def destroy
  end
  
  def show
    @profile = User.find(current_user.id).profile
    @favorite_pictures = @user.favorite_pictures
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
  
  def profile_params
    params.require(:profile).permit(:image, :image_cache)
  end
  
  def set_user
    @user = User.find(current_user.id)
  end
end
