# frozen_string_literal: true

module Users
  # List users in the admin panel
  class ListInteractor
    include Interactor

    def call
      context.list = User.all.order(:email)
    end
  end
end
