class PicturesController < ApplicationController
  before_action :set_picture, only: [:show, :edit, :update, :destroy]
  before_action :login_check, only: [:new, :edit, :show, :destroy]
  before_action :prevention, only: [:edit, :destroy]
  
  def index
    @picture = Picture.order(id: :desc).all
  end
  
  def new
    if params[:back]
      @picture = Picture.new(picture_params)
    else
      @picture = Picture.new
    end
  end
  
  def create
    @picture = current_user.pictures.build(picture_params)
    if @picture.save
      ContactMailer.picture_mail(current_user).deliver
      redirect_to pictures_path
    else
      render 'new'
    end
  end
  
  def edit
  end
  
  def update
    if @picture.update(picture_params)
      redirect_to pictures_path
    else
      render 'edit'
    end
  end
  
  def confirm
    @picture = current_user.pictures.build(picture_params)
    render :new if @picture.invalid?
  end
  
  def destroy
    @picture.destroy
    redirect_to pictures_path
  end
  
  def show
    @favorite = current_user.favorites.find_by(picture_id: @picture.id)
  end
  
  private
  
  def picture_params
    params.require(:picture).permit(:content, :image, :image_cache, :user_id)
  end
  
  def set_picture
    @picture = Picture.find(params[:id])
  end
  
  def prevention
    set_picture
    unless @picture.user_id == current_user.id
      redirect_to pictures_path
    end
  end
end
