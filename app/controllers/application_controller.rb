# frozen_string_literal: true

# ApplicationController
class ApplicationController < ActionController::Base
  include Pundit
  include Pagy::Backend

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  before_action :set_locale

  private

  def user_not_authorized
    flash[:alert] = 'You are not authorized to perform this action.'
    redirect_to(request.referrer || root_path)
  end

  def set_locale
    I18n.locale = :uk
  end
end
