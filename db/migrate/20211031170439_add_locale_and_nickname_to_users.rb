class AddLocaleAndNicknameToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :nickname, :string
    add_column :users, :locale, :string
  end
end
