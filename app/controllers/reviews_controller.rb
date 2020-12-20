class ReviewsController < ApplicationController
  before_action :redirect_if_not_logged_in

  def index
    @reviews = Review.all
  end

  def new
    @review = Review.new
  end

  def create
    byebug
    @review = Review.new(review_params)
  end

  def show
  end

  def edit
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
