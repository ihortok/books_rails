class CreateUserRecords < ActiveRecord::Migration[6.1]
  def change
    create_view :user_records, materialized: true
  end
end
