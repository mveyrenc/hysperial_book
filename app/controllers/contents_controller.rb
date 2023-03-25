# frozen_string_literal: true

class ContentsController < ApplicationController

  def index
    render Contents::IndexView::Component.new(Content.order(title: :asc))
  end

end
