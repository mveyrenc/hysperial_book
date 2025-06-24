# frozen_string_literal: true

# Enable pgcrypto in postgresql to use uuid
class EnableUuid < ActiveRecord::Migration[8.0]
  def change
    enable_extension 'pgcrypto'
  end
end
