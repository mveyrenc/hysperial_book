# frozen_string_literal: true

# Default application policy
class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    raise Pundit::NotAuthorizedError, 'must be logged in' unless user

    @user = user
    @record = record
  end

  def index?
    false
  end

  def show?
    false
  end

  def create?
    false
  end

  def new?
    create?
  end

  def update?
    false
  end

  def edit?
    update?
  end

  def destroy?
    false
  end

  # Default scope policy
  class Scope
    def initialize(user, scope)
      raise Pundit::NotAuthorizedError, 'must be logged in' unless user

      @user = user
      @scope = scope
    end

    def resolve
      raise NotImplementedError, "You must define #resolve in #{self.class}"
    end

    private

    attr_reader :user, :scope
  end

  private

  def grant_to_super_admin
    user.super_admin_role?
  end

  def grant_to_admin
    user.admin_role? || user.super_admin_role?
  end

  def grant_to_contributor
    user.contributor_role? || user.admin_role? || user.super_admin_role?
  end

  def grant_to_reader
    user.reader_role? || user.contributor_role? || user.admin_role? || user.super_admin_role?
  end
end
