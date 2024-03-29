# frozen_string_literal: true

# Devise views helper
module DeviseViewsHelper
  # rubocop:disable Metrics/MethodLength
  # rubocop:disable Metrics/AbcSize
  def devise_error_messages!
    return '' if resource.errors.empty?

    messages = resource.errors.full_messages.map { |message| content_tag(:li, message) }.join
    sentence = I18n.t(
      'errors.messages.not_saved',
      count: resource.errors.count,
      resource: resource.class.model_name.human.downcase
    )

    html = <<-HTML
        <div class="notification is-danger">
          <button type="button" class="delete" data-dismiss="notification" aria-label="Close"></button>
          <h4 class="subtitle is-4">#{sentence}</h4>
          <ul class="content">#{messages}</ul>
        </div>
    HTML

    # rubocop:disable Rails/OutputSafety
    html.html_safe
    # rubocop:enable Rails/OutputSafety
  end
  # rubocop:enable Metrics/MethodLength
  # rubocop:enable Metrics/AbcSize
end
