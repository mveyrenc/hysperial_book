# frozen_string_literal: true

module Books::NewButton

  class Component < Books::BookViewComponent
    def call
      link_to I18n.t(virtual_path + '.name'), new_book_path, class: "btn btn-block btn-secondary"
    end
  end

  class Preview < Books::BookViewComponentPreview
    # You can specify the container class for the default template
    # self.container_class = "w-1/2 border border-gray-300"

    def default
    end
  end

end
