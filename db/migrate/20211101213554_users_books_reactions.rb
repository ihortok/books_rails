class UsersBooksReactions < ActiveRecord::Migration[6.1]
  def change
    create_table :users_books_reactions do |t|
      t.belongs_to :user
      t.belongs_to :book
      t.boolean :read, default: false
      t.boolean :like, default: false
      t.boolean :favority, default: false
    end
  end
end
