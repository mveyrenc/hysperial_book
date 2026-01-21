# frozen_string_literal: true

module IndexSearchActionsConcern
  extend ActiveSupport::Concern

  included do
    # GET /<resource>
    def index
      authorize model
      @records = call_search_interactor

      render template: template_path
    end

    # GET /<resource>/search
    def search
      authorize model, :index?
      @records = call_search_interactor

      render template: template_path('index')
    end

    protected

    def model
      raise NotImplementedError
    end

    def search_interactor
      "#{model.name.pluralize}::Interactors::SearchInteractor"
    end

    def call_search_interactor
      interactor = search_interactor
      raise NotImplementedError, "#{interactor} not implemented" unless Object.const_defined?(interactor)

      Kernel.const_get(interactor).call(search_context)
    end

    def search_context
      Interactor::Context.build(query: params)
    end
  end
end
