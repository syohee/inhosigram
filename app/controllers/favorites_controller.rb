class FavoritesController < ApplicationController
  def create
    favorite = current_user.favorites.create(picture_id: params[:picture_id])
    redirect_to pictures_url
  end

  def destroy
    favorite = current_user.favorites.find_by(id: params[:id]).destroy
    redirect_to pictures_url
  end
end
