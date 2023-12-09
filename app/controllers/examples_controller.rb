# frozen_string_literal: true

class ExamplesController < ApplicationController
  layout false

  def show
    respond_to do |format|
      format.html
    end
  end
end
