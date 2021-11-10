class CreateListsBooksJoinTable < ActiveRecord::Migration[6.1]
  def change
    create_join_table :books, :lists

    add_index :books_lists, :book_id
    add_index :books_lists, :list_id
    add_index :books_lists, [:book_id, :list_id], unique: true
  end
end
