# frozen_string_literal: true

module Admin
  class UsersController < ApplicationController
    before_action :authenticate_user!
    before_action :set_user
    before_action :authorize_access

    def edit; end

    def update
      if @user.update(user_params)
        redirect_to @user, notice: 'User was successfully updated.'
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @user.destroy

      redirect_to users_url, notice: 'User was successfully destroyed.'
    end

    private

    def set_user
      @user = User.find(params[:id])
    end

    def authorize_access
      authorize @user, :access?
    end

    def user_params
      params.require(:user).permit(:role)
    end
  end
end
