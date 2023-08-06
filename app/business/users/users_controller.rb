# frozen_string_literal: true

# Users controller
module Users
  # Users controller
  class UsersController < ApplicationController
    before_action :set_user, only: %i[edit update destroy]

    # GET /users
    def index
      authorize User
      @users = Users::Interactors::List.call(params)

      render template: template_path
    end

    # GET /users/:id/edit
    def edit
      authorize @user

      respond_to do |format|
        format.html { render template: template_path }
      end
    end

    # PATCH/PUT /users/:id
    def update
      authorize @user
      result = Users::Interactors::Update.call(user: @user, params: strong_params.to_h)

      if result.success?
        respond_to do |format|
          format.html { redirect_to users_url, notice: t('.successfully_updated') }
          format.turbo_stream { render template: template_path }
        end
      else
        render template: template_path(:edit), status: :unprocessable_entity
      end
    end

    # DELETE /users/:id
    def destroy
      authorize @user
      Users::Interactors::Destroy.call(user: @user)

      respond_to do |format|
        format.html { redirect_to users_url, notice: t('.successfully_destroyed') }
        format.turbo_stream { render template: template_path }
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
