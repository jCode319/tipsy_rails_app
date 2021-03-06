class UsersController < ApplicationController


  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to @user
    else
      render '/session/new'
    end
  end

  def show
    redirect_if_not_logged_in
    @user = User.find_by(id: params[:id])
    redirect_to root_path if !@user
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find_by(id: params[:id])
    @user.update(user_params)
    flash[:message] = "Your account has been updated"
    redirect_to @user
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :city, :state, :password, :favorite_cocktail)
  end

end
