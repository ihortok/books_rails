# frozen_string_literal: true

class Lists::BooksPusher
  def initialize(list:, book_id:)
    @list = list
    @book_id = book_id
  end

  def call
    book = Book.find(book_id)

    list.books << book

    OpenStruct.new(success?: true)
  rescue ActiveRecord::RecordNotUnique
    OpenStruct.new(success?: false, error: 'Book is already in the list')
  rescue StandardError => e
    OpenStruct.new(success?: false, error: e.to_s)
  end

  private

  attr_reader :list, :book_id
end
