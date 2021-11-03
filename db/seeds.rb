# frozen_string_literal: true

user = User.find_or_initialize_by(email: 'test@test.com')

unless user.persisted?
  user.nickname = 'test'
  user.password = '123456abc@'
  user.password_confirmation = '123456abc@'
  user.locale = 'uk'
  user.save!

  p 'user test@test.com - created'
end

books = [
  {
    title: 'Un capitaine de quinze ans',
    author: 'Jules Verne'
  },
  {
    title: 'White Fang',
    author: 'Jack London'
  },
  {
    title: 'Angels & Demons',
    author: 'Dan Brown'
  }
]

books.each do |b|
  next if Author.exists?(name: b[:author]) && Book.exists?(title: b[:title])

  author = Author.find_or_initialize_by(name: b[:author])

  unless author.persisted?
    author.user = user
    author.save!

    p "author #{b[:author]} - created"
  end

  next if Book.exists? title: b[:title]

  book = Book.create!(title: b[:title], author: author, user: user)

  p "book #{book.title} - created"

  BookReaction.create!(user: User.all.sample, book: book, like: [true, false].sample)

  p "reaction on #{book.title} - created"
end
