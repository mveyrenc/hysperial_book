# frozen_string_literal: true

# Application controller
class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  include Pundit::Authorization

  protect_from_forgery with: :exception

  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  # Append this param to bust the cache in development
  # https://localhost:3000?clear_cache=true
  before_action :clear_cache_if_requested if Rails.env.development?

  inertia_config(
    component_path_resolver: ->(path:, action:) do
      File.join('frontend', 'pages', path.delete_suffix("/#{controller_name}").camelize, action.camelize)
    end,
    prop_transformer: ->(props:) do
      props.deep_transform_keys { |key| key.to_s.camelize(:lower) }
    end
  )

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

  def render_inertia?(action = nil)
    Rails.root.join('app', 'frontend', 'pages', 'pages', controller_path.delete_suffix("/#{controller_name}").camelize, (action || action_name).camelize, '.vue').exist?
  end

  def template_path(action = nil)
    File.join(controller_path.delete_suffix("/#{controller_name}").to_s, 'views', action || action_name)
  end
end
