# frozen_string_literal: true

unless User.exists? email: 'test@test.com'
  User.create(
    email: 'test@test.com',
    password: '123456abc@',
    password_confirmation: '123456abc@'
  )

  p 'user test@test.com - created'
end

authors = ['Jules Verne', 'Jack London', 'Dan Brown']

authors.each do |author_name|
  next if Author.exists? name: author_name

  Author.create(name: author_name)

  p "author #{author_name} - created"
end
