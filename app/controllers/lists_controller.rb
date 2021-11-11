# frozen_string_literal: true

class ListsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_list, only: %i[show edit update destroy add_book delete_book]
  before_action :set_books, only: :show
  before_action :authorize_access, only: %i[show edit update destroy]

  def index
    @lists = current_user.lists
  end

  def show; end

  def new
    @list = List.new
  end

  def edit; end

  def create
    @list = current_user.lists.create(list_params)

    if @list.save
      redirect_to @list, notice: 'List was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @list.update(list_params)
      redirect_to @list, notice: 'List was successfully updated.' 
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @list.destroy

    redirect_to lists_url, notice: 'List was successfully destroyed.'
  end

  def add_book
    result = Lists::BooksPusher.new(list: @list, book_id: params[:list][:book_id]).call

    if result.success?
      redirect_to request.referer, notice: "Book was successfully added to #{@list.title}."
    else
      redirect_to request.referer, alert: result.error
    end
  end

  def delete_book
    result = Lists::BooksRemover.new(list: @list, book_id: params[:list][:book_id]).call

    if result.success?
      redirect_to request.referer, notice: "Book was successfully deleted from #{@list.title}."
    else
      redirect_to request.referer, alert: result.error
    end
  end

  private

  def set_list
    @list = List.find(params[:id])
  end

  def set_books
    @books = @list.books
  end

  def authorize_access
    authorize @list
  end

  def list_params
    params.require(:list).permit(:title)
  end
end
