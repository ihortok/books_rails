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

books.each do |book|
  next if Author.exists?(name: book[:author]) && Book.exists?(title: book[:title])

  author = Author.find_or_initialize_by(name: book[:author])

  unless author.persisted?
    author.user = user
    author.save!

    p "author #{book[:author]} - created"
  end

  next if Book.exists? title: book[:title]

  Book.create!(title: book[:title], author: author, user: user)

  p "book #{book[:title]} - created"
end
