# frozen_string_literal: true

class Lists::DefaultCreator
  def initialize(user)
    @user = user
  end

  def call
    I18n.locale = user.locale_before_type_cast

    create_favorite
    create_want_to_read
  end

  private

  attr_reader :user

  def create_favorite
    user.lists.create(title: I18n.t('lists.default.favorite'))
  end

  def create_want_to_read
    user.lists.create(title: I18n.t('lists.default.want_to_read'))
  end
end
