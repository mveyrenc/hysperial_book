# frozen_string_literal: true

# Tag policy
module Bookcase
  class ContentTagPolicy < ApplicationPolicy
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
end
