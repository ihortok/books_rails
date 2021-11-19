# frozen_string_literal: true

class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    true
  end

  def show?
    true
  end

  def create?
    return true if user.author_or_higher?
  end

  def new?
    create?
  end

  def update?
    return true if user.editor_or_higher?

    return true if user.author? && record.user == user

    false
  end

  def edit?
    update?
  end

  def destroy?
    update?
  end
end
