class DepartmentsController < ApplicationController
    
    before_action :authenticate_user!
    before_action :set_departmet, only: [:edit, :update, :confirm, :destroy]

    def index
        authorize Department
        @deps = Department.all
    end

    def new
        authorize Department
        @dep = Department.new
    end

    def create
        authorize Department
        @dep = Department.new(dep_params)
        if @dep.save
            flash[:notice] = 'تم انشاء الاداره بنجاح'
            redirect_to departments_path
        else
            render :new
        end
    end

    def edit
        authorize Department
    end

    def update
        authorize Department
        if @dep.update(dep_params)
            flash[:notice] = 'تم تعديل الاداره بنجاح.'
            redirect_to departments_path
        else
            render :edit
        end
    end

    def confirm
        authorize Department
    end

    def destroy
        authorize Department
        @dep.destroy
        flash[:notice] = 'تم حذف الاداره بنجاح.'
        redirect_to departments_path
    end

    private
    def dep_params
        params.require(:department).permit(:name, :code)
    end

    def set_departmet
        @dep = Department.find(params[:id])
    end

end
