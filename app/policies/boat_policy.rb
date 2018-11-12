class BoatPolicy < ApplicationPolicy

  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    (!user.nil? || user.admin)
  end

  def new?
    create?
  end

  def show?
    true
  end


  def destroy?
    (!user.nil? || user.admin)
  end

end
