class AddYearOfPublication < ActiveRecord::Migration[6.1]
  def change
    add_column :books, :published, :integer
  end
end
