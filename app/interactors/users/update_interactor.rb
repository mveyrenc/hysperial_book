# frozen_string_literal: true

module Users
  # Update a user and his role
  class UpdateInteractor
    include Interactor

    def call
      split_params
      update_attributes
      extract_current_role
      update_role
    end

    def split_params
      self.new_role = context.params[:role].presence
      self.attributes = context.params.except(:role)
    end

    def update_attributes
      context.fail!(message: 'update_user.failure') unless context.user.update(attributes)
    end

    def extract_current_role
      self.current_role = context.user.role
    end

    def update_role
      return unless new_role != current_role

      context.user.remove_role current_role unless current_role.nil?
      context.user.add_role new_role unless new_role.nil?
    end

    protected

    attr_accessor :new_role, :current_role, :attributes
  end
end
