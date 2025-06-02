class ApplicationController < ActionController::Base
  include Authentication
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  before_action :authenticate

 def authenticate
    Current.user = User.find_by(id: session[:user_id]) if session[:user_id]

    # @user_email = Current.user.email_address
  end

 def after_authentication_url
   goals_path
 end

end
