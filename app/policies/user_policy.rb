# frozen_string_literal: true

# User policy
class UserPolicy < ApplicationPolicy
  def index?
    user.admin?
  end

  def update?
    user.admin?
  end

  def destroy?
    user.super_admin? and !record.super_admin?
  end
end
