# frozen_string_literal: true

class ApplicationDecorator < Draper::Decorator
  protected

  def tip_tap_document(json_document)
    TipTap::Document.from_json(JSON.parse(json_document)).to_html
  end
end
