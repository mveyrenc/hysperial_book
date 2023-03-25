# frozen_string_literal: true

module Shared::NavigationMenu::ApplicationMenu

  class Component < ApplicationViewComponent
    self.i18n_scope = %w[navigation_menu application_menu]
  end

  class Preview < ApplicationViewComponentPreview
    # You can specify the container class for the default template
    # self.container_class = "w-1/2 border border-gray-300"

    def default
    end
  end

end
