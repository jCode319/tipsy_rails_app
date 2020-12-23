class CocktailBarsController < ApplicationController

def show
  @cocktail_bar = CocktailBar.find(params[:id])
end


end
