# frozen_string_literal: true

module Shared::DeleteButton

  class Component < ApplicationViewComponent

    param :object

    def call
      button_to I18n.t(virtual_path + ".name"), object,
                method: :delete,
                class: "btn btn-xs",
                form: { data: { controller: "delete" , action: "submit->delete#confirm", delete_message_value: I18n.t(virtual_path + ".destroy_confirmation") } }
    end
  end

end
