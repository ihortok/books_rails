# frozen_string_literal: true

namespace :data_generator do
  desc 'genarates users'
  task :users, [:number] => :environment do |_task, args|
    args.with_defaults(number: 1)

    args[:number].to_i.times do
      loop do
        user = FactoryBot.build(:user)

        next if User.exists? email: user.email

        user.save!
        p "user #{user.email} - created"

        break
      end
    end
  end

  desc 'genarates books'
  task :books, [:number] => :environment do |_task, args|
    args.with_defaults(number: 1)

    FactoryBot.create_list(:user, 2) if User.count < 2

    FactoryBot.create_list(:author, 2, user: User.all.sample) if Author.count < 2

    args[:number].to_i.times do
      loop do
        book = FactoryBot.build(:book, user: User.all.sample, author: Author.all.sample)

        next if Book.exists? title: book.title

        book.save!
        p "book #{book.title} - created"

        break
      end
    end
  end
end
