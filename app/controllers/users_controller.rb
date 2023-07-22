# frozen_string_literal: true

# Users controller
class UsersController < ApplicationController
  # GET /users or /users.json
  def index
    result = Users::ListUsersInteractor.call(params)
    @users = result.list
  end

  # GET /users/1/edit
  def edit
    result = Users::GetUserInteractor.call(id: params[:id])
    @user = result.user
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    attributes = params.require(:user).permit(:name, :email)
    role = params.require(:user).permit(:role)
    result = Users::UpdateUserInteractor.call(id: params[:id], attributes:, role:)
    @user = result.user

    if result.success?
      redirect_to users_url, notice: 'User was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    result = Users::DestroyUserInteractor.call(id: params[:id])

    if result.success?
      redirect_to users_url, notice: 'User was successfully destroyed.'
    else
      render users_url, status: :unprocessable_entity
    end
  end
end
