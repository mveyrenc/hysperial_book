# frozen_string_literal: true

module Bookcase
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
end
