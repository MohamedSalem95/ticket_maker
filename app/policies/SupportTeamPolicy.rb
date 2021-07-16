class SupportTeamPolicy < ApplicationPolicy

    def index?
        is_it_or_dev?
    end

    def in_progress?
        is_it_or_dev?
    end

    def colsed?
        is_it_or_dev?
    end

    private
    def is_it_or_dev?
        user.has_role? 2 or user.has_role? 3
    end

end