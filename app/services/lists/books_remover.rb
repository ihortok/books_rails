# frozen_string_literal: true

class Lists::BooksRemover
  def initialize(list:, book_id:)
    @list = list
    @book_id = book_id
  end

  def call
    book = Book.find(book_id)

    list.books.delete book

    OpenStruct.new(success?: true)
  rescue StandardError => e
    OpenStruct.new(success?: false, error: e.to_s)
  end

  private

  attr_reader :list, :book_id
end
