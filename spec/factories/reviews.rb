FactoryBot.define do
  factory :review do
    user
    book
    content { Faker::Lorem.paragraph(sentence_count: 10, random_sentences_to_add: 10) }
  end
end
