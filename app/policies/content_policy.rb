# frozen_string_literal: true

# Content policy
class ContentPolicy < ApplicationPolicy
  def index?
    grant_to_reader
  end

  def show?
    grant_to_reader
  end

  def create?
    grant_to_contributor
  end

  def update?
    if record.created_by == user
      grant_to_contributor
    else
      grant_to_admin
    end
  end

  def destroy?
    grant_to_admin
  end
end
