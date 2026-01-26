# frozen_string_literal: true

# Medium policy
module Bookcase
  class MediumPolicy < ApplicationPolicy
    def index?
      grant_to_admin
    end

    def show?
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
