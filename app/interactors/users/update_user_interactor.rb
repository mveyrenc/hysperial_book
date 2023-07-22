# frozen_string_literal: true

module Users
  # Update a user and his role
  class UpdateUserInteractor
    include Interactor

    include SetUser

    before do
      @new_role = context.role[:role].presence
      @current_role = context.user.role
    end

    def call
      context.fail!(message: 'update_user.failure') unless context.user.update(context.attributes)

      return unless @new_role != @current_role

      context.user.remove_role @current_role unless @current_role.nil?
      context.user.add_role @new_role unless @new_role.nil?
    end
  end
end
