FactoryBot.define do
  factory :review do
    user
    book
    title { Faker::Lorem.sentence }
    content { Faker::Lorem.paragraph(sentence_count: 10) }
    book_title { book.title }
  end
end
