# frozen_string_literal: true

# Tag policy
class ContentTagPolicy < ApplicationPolicy
  def index?
    user.admin_role? || user.super_admin_role?
  end

  def create?
    user.admin_role? || user.super_admin_role?
  end

  def update?
    user.admin_role? || user.super_admin_role?
  end

  def destroy?
    user.admin_role? || user.super_admin_role?
  end
end