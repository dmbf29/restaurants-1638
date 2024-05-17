class RestaurantPolicy < ApplicationPolicy
  # NOTE: Up to Pundit v2.3.1, the inheritance was declared as
  # `Scope < Scope` rather than `Scope < ApplicationPolicy::Scope`.
  # In most cases the behavior will be identical, but if updating existing
  # code, beware of possible changes to the ancestors:
  # https://gist.github.com/Burgestrand/4b4bc22f31c8a95c425fc0e30d7ef1f5

  class Scope < ApplicationPolicy::Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all

      # An example for a Booking#index
      # user.bookings
      # scope.where(user: user)
    end
  end

  def new?
    true
  end

  def create?
    true
  end

  def show?
    true
  end

  def edit?
    # is the owner of the restaurant the same as the person logged in?
    owner_or_admin?
  end

  def update?
    # is the owner of the restaurant the same as the person logged in?
    owner_or_admin?
  end

  def destroy?
    # is the owner of the restaurant the same as the person logged in?
    owner_or_admin?
  end

  private

  def owner_or_admin?
    record.user == user || user.admin?
  end
end
