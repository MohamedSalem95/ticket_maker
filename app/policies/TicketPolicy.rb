class TicketPolicy < ApplicationPolicy
    
    def show?
        # only ticket owner or it and dev
        user == record.owner or user.roles.first.code == record.category_code + 2
    end

    def edit?
        # only ticket handler can edit the ticket
        user == record.handler
    end

    def update?
        # only ticket handler can edit the ticket
        user == record.handler
    end

    def withdraw?
        # withdraw ticket according to type
        user.roles.first.code == record.category_code + 2
    end

    def look?
        user.roles.first.code == record.category_code + 2
    end

end