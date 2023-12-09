# frozen_string_literal: true

# Book policy
class BookPolicy < ApplicationPolicy
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
