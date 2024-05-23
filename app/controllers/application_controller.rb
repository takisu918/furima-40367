class ApplicationController < ActionController::Base
  before_action :basic_auth, :configure_permitted_parameters, if: :devise_controller?


  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == 'admin' && password == '2222'
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :last_name, :first_name, :reading_last_name, :reading_first_name, :birth_date])
  end

end
