class BookReactions < ActiveRecord::Migration[6.1]
  def change
    create_table :book_reactions do |t|
      t.belongs_to :user
      t.belongs_to :book
      t.boolean :like, default: false
    end
  end
end
