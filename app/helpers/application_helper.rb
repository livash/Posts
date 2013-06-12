module ApplicationHelper

  def current_user
    #return nil if session[:session_token].nil?
    User.find_by_session_token(session[:session_token])
  end

  def verify_user
    current_user.session_token == session[:session_token]
  end


end
