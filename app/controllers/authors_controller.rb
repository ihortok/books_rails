# frozen_string_literal: true

class AuthorsController < ApplicationController
  before_action :authenticate_user!, only: %i[edit create update destroy]
  before_action :set_author, only: %i[show edit update destroy]
  before_action :authorize_access, only: %i[edit update destroy]

  def index
    @pagy, @authors = pagy(Author.all)
  end

  def show; end

  def new
    @author = Author.new
  end

  def edit; end

  def create
    @author = current_user.authors.build(author_params)

    if @author.save
      redirect_to @author, notice: 'Author was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @author.update(author_params)
      redirect_to @author, notice: 'Author was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @author.destroy

    redirect_to authors_url, notice: 'Author was successfully destroyed.'
  end

  private

  def set_author
    @author = Author.find(params[:id])
  end

  def authorize_access
    authorize @author, :edit?
  end

  def author_params
    params.require(:author).permit(:name, :original_name, :wikipedia_url, :image)
  end
end
