# frozen_string_literal: true

# User policy
class UserPolicy < ApplicationPolicy
  def index?
    grant_to_admin
  end

  def update?
    grant_to_admin
  end

  def destroy?
    grant_to_super_admin and !record.super_admin_role?
  end
end
