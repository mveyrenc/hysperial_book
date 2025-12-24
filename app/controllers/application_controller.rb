# frozen_string_literal: true

# Application controller
class ApplicationController < ActionController::Base
  include CableReady::Broadcaster

  protect_from_forgery with: :exception

  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  # Append this param to bust the cache in development 🙌
  # https://localhost:3000?clear_cache=true
  before_action :clear_cache_if_requested if Rails.env.development?

  include Pundit::Authorization

  protected

  def clear_cache_if_requested
    Rails.cache.clear if params[:clear_cache].present?
  end

  def authorize_record
    authorize @record
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end

  def template_path(action = nil)
    "#{controller_name}/views/#{action || action_name}"
  end
end
