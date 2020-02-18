class WeaponPolicy < ApplicationPolicy

  def index?
    true
  end

  def show?
    true
  end

  def destroy?
    record.user == user
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
