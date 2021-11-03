# frozen_string_literal: true

class BookReactionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_book_reaction, only: :update

  def create
    book_reaction = current_user.book_reactions.build(book_reaction_params)

    if book_reaction.save
      redirect_to request.referer
    else
      redirect_to request.referer, alert: book_reaction.errors.full_messages
    end
  end

  def update
    if @book_reaction.update(book_reaction_params)
      redirect_to request.referer
    else
      redirect_to request.referer, alert: book_reaction.errors.full_messages
    end
  end

  private

  def set_book_reaction
    @book_reaction = BookReaction.find(params[:id])
  end

  def book_reaction_params
    params.require(:book_reaction).permit(:like, :book_id)
  end
end
