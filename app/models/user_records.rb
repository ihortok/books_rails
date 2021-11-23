class UserRecords < ApplicationRecord
  belongs_to :searchable, polymorphic: true
end
