# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: :show
  before_action :set_book_reactions, only: :show

  def index
    @users = User.all
  end

  def show; end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def set_book_reactions
    @liked_books = @user.books.joins(:book_reactions).where(book_reactions: { like: true })
    @unliked_books = @user.books.joins(:book_reactions).where(book_reactions: { like: false })
  end
end
