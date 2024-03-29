# frozen_string_literal: true

# Registrations controller
class RegistrationsController < Devise::RegistrationsController
  def update_resource(resource, params)
    resource.update_without_password(params)
  end
end
