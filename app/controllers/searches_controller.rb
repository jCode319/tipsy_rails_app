class SearchesController < ApplicationController

  # def new
  #   byebug
  #    @search = Search.new
  #    redirect_to @search
  #  end

  def create
    @search = Search.create(query: params[:query], user: current_user)
    if CocktailBar.yelp_search_result(params[:query], @search) == "error"
      redirect_to root_path
    else
      @search.save
      redirect_to @search
    end
  end

  def show
    @search = Search.find(params[:id])
  end

  private
  def search_params
    params.require(:query).permit(:query)
  end

end
