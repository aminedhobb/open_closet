class OrderPolicy < ApplicationPolicy
  def create?
    true
  end

  def update?
    user == record.product.user
  end

  class Scope < Scope
    def resolve
      scope
    end
  end
end
