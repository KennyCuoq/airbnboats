class BoatPolicy < ApplicationPolicy

  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    (record.user == user || user.admin)
  end

  def new?
    create?
  end

  def show?
    true
  end


  def destroy?
    (record.user == user || user.admin)
  end

end
