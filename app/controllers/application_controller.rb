class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    flash[:notice] = "Signed in successfully."
    user_path(current_user.id)
  end

  def after_sign_out_path_for(resource)
    flash[:notice] = "Signed out successfully."
    root_path
  end


private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email])
    devise_parameter_sanitizer.permit(:sign_in, keys:[:name])
    devise_parameter_sanitizer.permit(:sign_up, keys: [
      :postcode,
      :prefecture_name,
      :address_city,
      :address_street,
      :address_building
      ])
  end
end
