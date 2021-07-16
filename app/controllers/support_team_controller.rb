class SupportTeamController < ApplicationController

    before_action :authenticate_user!

    def index
        authorize :support_team, :index?
        user_role_code = current_user.roles.first.code
        puts("role code#{user_role_code}")
        cat_code = 0
        case user_role_code
        when 2
            category_code = 0
        when 3
            category_code = 1
        end

        puts(category_code)
        
        @tickets = Ticket.find_by_cat(category_code).page(params[:page])
        @count = Ticket.find_by_cat(category_code).count
    end


    def in_progress
        authorize :support_team, :in_progress?
        @tickets = current_user.handling_tickets.where(status: 1).page(params[:page])
        @count = current_user.handling_tickets.where(status: 1).count
    end

    def closed
        authorize :support_team, :colsed?
        @count = current_user.handling_tickets.where(status: 2).count
        @tickets = current_user.handling_tickets.where(status: 2).order(updated_at: :desc).page(params[:page])
    end
end
