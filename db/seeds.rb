# frozen_string_literal: true

unless User.exists?(email: 'test@test.com')
  FactoryBot.create(
    :user,
    :admin,
    email: 'test@test.com',
    password: '123456abc@',
    nickname: 'test'
  )

  p 'test user added'
end

FactoryBot.create_list(:user, 2, :author)

p '2 users added'

5.times { FactoryBot.create(:author, user: User.all.sample) }

p '5 authors added'

10.times { FactoryBot.create(:book, user: User.all.sample, author: Author.all.sample) }

p '10 books added'

reviews_counter = 0

Book.all.each do |book|
  User.all.each do |user|
    next if Review.exists?(user: user, book: book)

    FactoryBot.create(:review, user: user, book: book)

    reviews_counter += 1
  end
end

p "#{reviews_counter} reviews added"
