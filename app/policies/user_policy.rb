# frozen_string_literal: true

# User policy
class UserPolicy < ApplicationPolicy
  def index?
    user.admin_role? || user.super_admin_role?
  end

  def update?
    user.admin_role? || user.super_admin_role?
  end

  def destroy?
    user.super_admin_role? and !record.super_admin_role?
  end
end
