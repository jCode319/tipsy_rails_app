class SessionsController < ApplicationController

  def create
    user = User.find_by(email: params[:user][:email])
    if user && user.authenticate(params[:user][:password])
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      flash[:message] = "Your username or password is correct, please try again"
      redirect_to login_path
    end
  end

  def google_auth
      @user = User.find_or_create_by(email: auth.info.email) do |user|
        user.username = auth.info.first_name
        user.email = auth.info.email
        user.password = SecureRandom.hex(12)
      end
    if @user.save
      session[:user_id] = @user.id
      redirect_to @user
    else
      flash[:message] = "Your username or password is correct, please try again"
      redirect_to login_path    
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end

  private

  def auth
    request.env['omniauth.auth']
  end

end
