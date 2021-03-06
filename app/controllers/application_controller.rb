class ApplicationController < ActionController::Base
  protect_from_forgery

  def access_denied(exception)
    redirect_to root_path, alert: exception.message
  end
  before_action :configure_permitted_parameters, if: :devise_controller?

  rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      format.html { redirect_to main_app.root_url, notice: exception.message }
    end
  end

  def after_sign_in_path_for(resource)
    if current_user.role_id == 1
      admin_root_path
    elsif current_user.role_id == 3
      stores_path
    else
      root_path
    end
  end


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [
        :name, :email, :avatar,:address
    ])
  end
end
