# frozen_string_literal: true

# Tag family policy
class ContentTagFamilyPolicy < ApplicationPolicy
  def index?
    grant_to_admin
  end

  def create?
    grant_to_admin
  end

  def update?
    grant_to_admin
  end

  def destroy?
    grant_to_admin
  end
end
