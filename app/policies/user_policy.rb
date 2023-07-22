# frozen_string_literal: true

# User policy
class UserPolicy < ApplicationPolicy
  def index?
    user.has_role? :admin
  end

  def update?
    user.has_role? :admin
  end

  def destroy?
    user.has_role? :super_admin and !record.has_role? :super_admin
  end
end
