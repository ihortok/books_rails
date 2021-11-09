# frozen_string_literal: true

class ListPolicy < ApplicationPolicy
  def show?
    return true if record.user == user

    false
  end

  def edit?
    show?
  end

  def update?
    show?
  end

  def destroy?
    show?
  end
end
