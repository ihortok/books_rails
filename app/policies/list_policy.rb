# frozen_string_literal: true

class ListPolicy < ApplicationPolicy
  def show?
    return true if record.user == user

    false
  end

  def update?
    show?
  end

  def edit?
    update?
  end

  def destroy?
    update?
  end

  def add_book?
    update?
  end

  def delete_book?
    update?
  end
end
