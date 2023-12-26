# frozen_string_literal: true

class UserRole
  extend ActiveModel::Translation

  ROLES = %w[super_admin admin contributor reader noob].freeze

  def initialize(role)
    @role = role
  end

  def self.roles
    ROLES.index_by(&:to_sym).to_h
  end
end
