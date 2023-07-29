# frozen_string_literal: true

# Book policy
class BookPolicy < ApplicationPolicy
  def index?
    user.has_role? :admin
  end

  def update?
    user.has_role? :admin
  end
end
