# frozen_string_literal: true

module ContentRecipes::DeleteButton

  class Component < ApplicationViewComponent

    param :object

    def call
      form_tag object, method: :delete, class: "inline", data: { confirm: I18n.t(virtual_path + '.destroy_confirmation') } do
        button_tag I18n.t(virtual_path + '.name'), class: "btn btn-xs"
      end
    end

  end

  class Preview < ApplicationViewComponentPreview
    # You can specify the container class for the default template
    # self.container_class = "w-1/2 border border-gray-300"

    def default
    end
  end

end
