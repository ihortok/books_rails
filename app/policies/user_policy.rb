# frozen_string_literal: true

class UserPolicy < ApplicationPolicy
  def access?
    return true if user.admin?

    false
  end
end
