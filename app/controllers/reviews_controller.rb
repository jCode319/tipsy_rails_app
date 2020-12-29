class ReviewsController < ApplicationController
  before_action :redirect_if_not_logged_in

  def index
    # if params[:cocktail_bar_id] && @cocktail_bar = CocktailBar.find_by_id(params[:cocktail_bar_id])
      # @review = @cocktail_bar.reviews
    # else
      # @error = "That review doesn't exist" if params[:cocktail_bar_id]
      @reviews = Review.all
    # end
  end

  def new
    if params[:cocktail_bar_id] && @cocktail_bar = CocktailBar.find_by_id(params[:cocktail_bar_id])
      @review = @cocktail_bar.reviews.build
    else
      @error = "That review doesn't exist" if params[:cocktail_bar_id]
      @review = Review.new
    end
  end

  def create
    @cocktail_bar = CocktailBar.find(params[:cocktail_bar_id])
    @review = current_user.reviews.build(review_params)
    @review[:cocktail_bar_id] = @cocktail_bar[:id]
    if @review.save
      redirect_to @review #maybe route to cocktail_bar instead. After finishing CB
    else
      byebug
      render :new
    end
  end

  def show
    if params[:cocktail_bar_id] && @cocktail_bar = CocktailBar.find_by_id(params[:cocktail_bar_id])
      @review = @cocktail_bar.reviews
    else
      @review = Review.find(params[:id])
    end
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])
    @review.update(review_params)
    if @review.save
      redirect_to @review
    else
      render :edit
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to reviews_path
  end

  private

  def review_params
    params.require(:review).permit(:title, :comment, :rating, :user_id, :cocktail_bar_id)
  end


end
