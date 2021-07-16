class AdminTeamPolicy < ApplicationPolicy

    def index?
        is_admin?
    end

    private
    def is_admin?
        user.has_role? 0
    end
end