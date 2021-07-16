class ApplicationController < ActionController::Base

    include Pundit

    before_action :configure_permitted_parameters, if: :devise_controller?

    protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :const_no, :phone_no, :bio, :job, :department_code])
        devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :const_no, :phone_no, :bio, :job, :department_code])
    end

    def after_sign_out_path_for(resource)
        stored_location_for(resource) || new_user_session_path
    end

    def after_sign_up_path_for(resource)
        stored_location_for(resource) || root_path
    end
end
