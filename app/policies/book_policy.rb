# frozen_string_literal: true

class BookPolicy < ApplicationPolicy
  def edit?
    return true if record.user == user

    false
  end
end
