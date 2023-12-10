# frozen_string_literal: true

# Users controller
module Users
  # Users controller
  class UsersController < ApplicationController
    before_action :set_record, only: %i[edit update destroy]
    before_action :set_new_record, only: %i[create new]
    before_action :authorize_record, only: %i[create new edit update destroy]

    # GET /users
    def index
      @records = Users::Logics::Search.call(params)

      render template: template_path
    end

    # GET /users/:id/edit
    def edit
      respond_to do |format|
        format.html { render template: template_path }
      end
    end

    # PATCH/PUT /users/:id
    def update
      result = Users::Logics::Update.call(user: @record, params: strong_params.to_h)

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
      Users::Logics::Destroy.call(user: @record)

      respond_to do |format|
        format.html { redirect_to users_url, notice: t('.successfully_destroyed') }
        format.turbo_stream { render template: template_path }
      end
    end

    private

    def set_record
      @record = User.find(params[:id])
    end

    def set_new_record
      raise NotImplementedError
    end

    def strong_params
      params.require(:user).permit(:name, :email, :role)
    end
  end
end
