class ReviewsController < ApplicationController
  before_action :redirect_if_not_logged_in

  def index
    @reviews = Review.all
  end

  def new
    @review = Review.new
  end

  def create
    @cocktail_bar = CocktailBar.first
    @review = current_user.reviews.build(review_params)
    @review[:cocktail_bar_id] = @cocktail_bar[:id]
    if @review.save
      redirect_to @review #maybe route to cocktail_bar instead. After finishing CB

    else
      render :new
    end
  end

  def show
    @review = Review.find(params[:id])
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
  end

  def destroy
  end

  private

  def review_params
    params.require(:review).permit(:title, :comment, :rating, :user_id, :cocktail_bar_id)
  end


end
