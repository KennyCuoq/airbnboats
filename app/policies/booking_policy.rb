class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    true
  end

  def update?
    (record.user == user || user.admin)
  end

  def edit?
    update?
  end

  def show?
    (record.user == user || user.admin)
  end
end
