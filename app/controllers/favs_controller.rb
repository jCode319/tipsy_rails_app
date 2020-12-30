class FavsController < ApplicationController
  before_action :redirect_if_not_logged_in

  def index
    @favs = Fav.all
  end

  def new
    if params[:cocktail_bar_id] && @cocktail_bar = CocktailBar.find_by_id(params[:cocktail_bar_id])
      @fav = @cocktail_bar.favs.build
    else
      @error = "That fav doesn't exist" if params[:cocktail_bar_id]
      @fav = Fav.new
    end
  end

  def create
    @cocktail_bar = CocktailBar.find(params[:cocktail_bar_id])
    @fav = current_user.favs.build
    @fav[:cocktail_bar_id] = @cocktail_bar[:id]
    if @fav.save
      redirect_to favs_path
    else
      flash[:error] = "We were unable to add this location to your favorites, please try again"
      redirect_to current_user
    end
  end

  def destroy
    @fav = Fav.find_by(id: params[:id])
    @fav.destroy
    redirect_to current_user
  end

  private

end
