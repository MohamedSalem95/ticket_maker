class AdminTeamController < ApplicationController
    before_action :authenticate_user!

    def index
        authorize :admin_team, :index?
    end
    
end
