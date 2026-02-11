# frozen_string_literal: true

module Bookcase
  module ContentAttributes
    module Components
      module Form
        module QuantitativeValue
          class Component < ContentAttributes::Components::Form::BaseComponent
            # data :
            # - max_value	      Number	The upper value of some characteristic or property.
            # - min_value	      Number	The lower value of some characteristic or property.
            # - unit_code	      Text	  The unit of measurement given using the UN/CEFACT Common Code (3 characters) or a URL. Other codes than the UN/CEFACT Common Code may be used with a prefix followed by a colon.
            # - unit_text	      Text	  A string or text indicating the unit of measurement. Useful if you cannot provide a standard unit code for unitCode.
            # - value	          Number  The value of a QuantitativeValue (including Observation) or property value node.
          end
        end
      end
    end
  end
end
