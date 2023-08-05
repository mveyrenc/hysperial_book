# frozen_string_literal: true

# Users controller
module Users
  # Users controller
  class UsersController < ApplicationController
    before_action :set_user, only: %i[edit update destroy]

    # GET /users
    def index
      @users = Users::Interactors::List.call(params)

      render template: template_path, content_type: 'text/html'
    end

    # GET /users/:id/edit
    def edit
      render template: template_path, content_type: 'text/html'
    end

    # PATCH/PUT /users/:id
    def update
      result = Users::Interactors::Update.call(user: @user, params: strong_params.to_h)

      if result.success?
        redirect_to users_url, notice: t('.successfully_updated')
      else
        render template: template_path(:edit), content_type: 'text/html', status: :unprocessable_entity
      end
    end

    # DELETE /users/:id
    def destroy
      result = Users::Interactors::Destroy.call(user: @user)

      if result.success?
        redirect_to users_url, notice: t('.successfully_destroyed')
      else
        render users_url, status: :unprocessable_entity
      end
    end

    private

    def set_user
      @user = User.find(params[:id])
    end

    def strong_params
      params.require(:user).permit(:name, :email, :role)
    end
  end
end
