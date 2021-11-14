# frozen_string_literal: true

class BookPolicy < ApplicationPolicy
  def create?
    return true if user.admin? || user.editor? || user.author?
  end

  def update?
    return true if user.admin? || user.editor?

    return true if user.author? && record.user == user

    false
  end

  def destroy?
    update?
  end
end
