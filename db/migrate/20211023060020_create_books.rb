class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.string :title
      t.string :original_title
      t.text :description
      t.integer :author_id
      t.string :goodreads_url

      t.timestamps
    end
  end
end
