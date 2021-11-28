# frozen_string_literal: true

class ReviewsController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]
  before_action :set_review, except: %i[index new create]

  def index
    book = Book.find_by(id: params[:book_id])

    @pagy, @reviews = pagy(book&.reviews || Review.all, items: 20)
  end

  def show; end

  def new
    @review = Review.new
  end

  def edit; end

  def create
    @review = current_user.reviews.create(review_params.merge(book_id: params[:book_id]))

    if @review.save
      redirect_to book_review_path(@review.book, @review), notice: 'Review was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @review.update(review_params)
      redirect_to book_review_path(@review.book, @review), notice: 'Review was successfully updated.'
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
    params.require(:review).permit(:content)
  end
end
