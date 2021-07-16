class UserPolicy < ApplicationPolicy

    def index?
        # if current user is admin
        is_admin?
    end

    def change_role?
        is_admin?
    end

    def change_role_update?
        is_admin?
    end

    def it_staff?
        is_admin?
    end

    def dev?
        is_admin?
    end

    def admin?
        is_admin?
    end


    private
    def is_admin?
        user.has_role? 0
    end

end