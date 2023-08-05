# frozen_string_literal: true

ActionController::Base.prepend_view_path ActionView::FileSystemResolver.new(
  Rails.root.join('app/business')
)
