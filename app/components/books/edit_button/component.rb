# frozen_string_literal: true

module Books::EditButton

  class Component < Books::BookViewComponent

    param :object

    def call
      link_to I18n.t(virtual_path + '.name'), edit_book_path(object), class: "btn btn-xs btn-secondary"
    end
  end

  class Preview < Books::BookViewComponentPreview
    # You can specify the container class for the default template
    # self.container_class = "w-1/2 border border-gray-300"

    def default
    end
  end

end
