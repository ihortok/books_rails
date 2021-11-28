class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.text :content
      t.belongs_to :user
      t.belongs_to :book

      t.timestamps
    end
  end
end
