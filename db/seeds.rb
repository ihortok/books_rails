# frozen_string_literal: true

user = User.find_or_initialize_by(email: 'test@test.com')

unless user.persisted?
  user.password = '123456abc@'
  user.password_confirmation = '123456abc@'
  user.save!

  p 'user test@test.com - created'
end

authors = ['Jules Verne', 'Jack London', 'Dan Brown']

authors.each do |author_name|
  next if Author.exists? name: author_name

  Author.create(name: author_name, user: user)

  p "author #{author_name} - created"
end
