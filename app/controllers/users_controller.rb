class UsersController < ApplicationController

    before_action :authenticate_user!

    def index
        authorize User
        @users = User.latest.page(params[:page])
    end

    def profile
        @user = User.find(params[:id])
    end

    def change_role
        authorize User
        @user = User.find(params[:id])
        @roles = Role.all.map { |role| [role.name, role.code] }
    end

    def change_role_update
        authorize User
        user = User.find(params[:id])
        user.add_role(role_code)
        flash[:notice] = 'تم التعديل بنجاح'
        redirect_to users_path
    end

    def new_image
    end

    def update_image
        current_user.update(image_params)
        flash[:notice] = 'تم تحديث صوره الملف الشخصي بنجاح.'
        redirect_to user_profile_path(current_user)
    end

    def it_staff
        authorize User
        # @users = User.where(User.roles.first.code: 2)
        ## this try led to final solution
        # @users = User.all.map { |user| user if user.roles.first.code == 2 }.compact
        # @users = User.where(roles.first.code: 2)
        @users = User.joins(:roles).where('roles.code =  2').page(params[:page])
    end

    def dev
        authorize User
        ## this try led to final solution
        # @users = User.all.map { |user| user if user.roles.first.code == 3 }.compact
        @users = User.joins(:roles).where('roles.code = 3').page(params[:page])
    end

    def admin
        authorize User
        # @users = User.all.map { |user| user if user.roles.first.code == 0 }.compact
        ## this try led to final solution
        @users = User.joins(:roles).where('roles.code = 0').page(params[:page])
    end

    private
    def role_code
        params.require(:model).permit(:role_code)[:role_code]
    end

    def image_params
        params.require(:image).permit(:avatar)
    end

end
