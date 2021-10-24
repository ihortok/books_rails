# frozen_string_literal: true

class AuthorPolicy < ApplicationPolicy
  def edit?
    return true if record.user == user

    false
  end
end
