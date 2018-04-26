class OrderPolicy < ApplicationPolicy
  def create?
    true
  end

  def update?
    user == record.product.user || user == record.user
  end

  def owner?
    true
  end

  class Scope < Scope
    def resolve
      scope
    end
  end
end
