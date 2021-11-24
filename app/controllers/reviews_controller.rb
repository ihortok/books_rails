# frozen_string_literal: true

class ReviewsController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]
  before_action :set_review, except: %i[index new create]

  def index
    @reviews = Review.all
  end

  def show; end

  def new
    @review = Review.new
  end

  def edit; end

  def create
    @review = current_user.reviews.create(review_params)

    if @review.save
      redirect_to @review, notice: 'Review was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @review.update(review_params)
      redirect_to @review, notice: 'Review was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @review.destroy

    redirect_to reviews_url, notice: 'Review was successfully destroyed.'
  end

  private

  def set_review
    @review = Review.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:title, :content)
  end
end
