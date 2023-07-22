# frozen_string_literal: true

# Find user from params[:id] and assign it to context.user
module SetUser
  extend ActiveSupport::Concern

  included do
    before do
      if context.id
        context.user = User.find(context.id)
      else
        context.fail!(error: 'users.get_user_form_params.is_missing')
      end
    end
  end
end
