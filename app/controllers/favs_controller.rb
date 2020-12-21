class FavsController < ApplicationController
  before_action :redirect_if_not_logged_in

  def new
    @fav = Fav.new
  end

  def create
    byebug
    @cocktail_bar = CocktailBar.first
    @fav = current_user.favs.build(set_fav)
    @fav[:cocktail_bar_id] = @cocktail_bar[:id]
    if @fav.save
      redirect_to current_user
    else
      render :new
    end
  end

  def destroy
    byebug
    @fav = Fav.find_by
    @fav.destroy
    redirect_to current_user
  end

  private


end
