class SessionsController < ApplicationController

  def home

  end

  def new
    @user = User.new
  end

  def  show
    @user = User.find_by(id: params[:id])

  end

  def create

  end

  private

  def user_params

  end

end
