class RolePolicy < ApplicationPolicy

    def index?
        is_admin?
    end

    def new?
        is_admin?
    end

    def create?
        is_admin?
    end

    def edit?
        is_admin?
    end

    def update?
        is_admin?
    end

    def confirm?
        is_admin?
    end

    def destroy?
        is_admin?
    end

    private
    def is_admin?
        user.has_role? 0
    end

end