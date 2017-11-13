class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def authenticate_admin
    if( current_user.try( :admin? ) )
      return
    else
      redirect_to root_url
    end
  end

end
