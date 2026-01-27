# frozen_string_literal: true

# Media controller
module Bookcase
  module Media
    # Media controller
    class MediaController < ApplicationController
      include IndexSearchActionsConcern
      include NewCreateActionsConcern
      include EditUpdateActionsConcern
      include DestroyActionConcern

      private

      def search_context
        Interactor::Context.build(query: params, model: model)
      end

      def search_interactor
        'Bookcase::Media::Interactors::SearchInteractor'
      end

      def create_interactor
        'Bookcase::Media::Interactors::CreateInteractor'
      end

      def update_interactor
        'Bookcase::Media::Interactors::UpdateInteractor'
      end

      def template_path(action = nil)
        "bookcase/media/views/#{action || action_name}"
      end

      def strong_params
        raise NotImplementedError
      end
    end
  end
end
