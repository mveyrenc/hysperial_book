# frozen_string_literal: true

# Users controller
module Users
  # Users controller
  class UsersController < ApplicationController
    include IndexSearchActionsConcern
    include EditUpdateActionsConcern
    include DestroyActionConcern

    private

    def model
      User
    end

    def redirect_to_after_create
      users_path
    end

    def redirect_to_after_update
      users_path
    end

    def redirect_to_after_destroy
      users_path
    end

    def strong_params
      params.require(:user).permit(:name, :email, :role)
    end
  end
end
