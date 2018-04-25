class ProductPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def update?
    user == record.user
  end

  def create?
    true
  end

  def index?
    true
  end
end
