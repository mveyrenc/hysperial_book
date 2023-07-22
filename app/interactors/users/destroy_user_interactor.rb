# frozen_string_literal: true

module Users
  class DestroyUserInteractor
    include Interactor

    include SetUser

    def call
      context.user.destroy
    end
  end
end
