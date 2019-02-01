class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.find_by(name: params[:session][:name].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to pictures_path
    else
      flash.now[:danger] = 'login failed'
      render 'new'
    end
  end
  
  def destroy
    session.delete(:user_id)
    flash[:notice] = 'logout success'
    redirect_to pictures_path
  end
end
