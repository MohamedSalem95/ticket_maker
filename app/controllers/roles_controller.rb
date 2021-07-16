class RolesController < ApplicationController

    before_action :authenticate_user!
    before_action :set_role, only: [:edit, :update, :confirm, :destroy]

    def index
        authorize Role
        @roles = Role.all
    end

    def new
        authorize Role
        @role = Role.new
    end

    def create
        authorize Role
        @role = Role.new(role_params)
        if @role.save
            flash[:notice] = 'تم انشاء الدور بنجاح.'
            redirect_to roles_path
        else
            render :new
        end
    end

    def edit
        authorize Role
    end

    def update
        authorize Role
        if @role.update(role_params)
            flash[:notice] = 'تم تعديل الدور بنجاح.'
            redirect_to roles_path
        else
            render :edit
        end
    end

    def confirm
        authorize Role
    end

    def destroy
        authorize Role
        @role.destroy
        flash[:notice] = 'تم حذف الدور بنجاح.'
        redirect_to roles_path
    end

    private
    def role_params
        params.require(:role).permit(:name, :code)
    end

    def set_role
        @role = Role.find(params[:id])
    end

end
