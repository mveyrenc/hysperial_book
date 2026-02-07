# frozen_string_literal: true

# Application helper
module ApplicationHelper
  def nested_dom_id(*args)
    args.map { |arg| arg.respond_to?(:to_key) ? dom_id(arg) : arg }.join('_')
  end

  def model_dom_id(record_or_model)
    (record_or_model.respond_to?(:to_model) ? record_or_model.to_model : record_or_model).model_name.plural
  end

  def name_field(f, multiple = false)
    multiple = false if f.object.persisted?
    return f.text_area :name, autofocus: true, help: t('.name.help') if multiple
    f.text_field :name, autofocus: true
  end

  def alternate_names_field(f)
    f.text_area :alternate_names
  end

  def description_field(f)
    f.text_area :description
  end

  def position_field(f)
    f.text_field :position
  end
end
