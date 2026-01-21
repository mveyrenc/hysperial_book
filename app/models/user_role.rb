# frozen_string_literal: true

class UserRole
  extend ActiveModel::Translation

  ROLES = %w[admin contributor noob reader super_admin].freeze

  def initialize(role)
    @role = role
  end

  def self.roles
    ROLES.index_by(&:to_sym).to_h
  end
end
