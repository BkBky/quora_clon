helpers do
  def current_user
    if session[:user_id]
      #Aquí, si @current_user es nil, entonces hace la búsqueda
      @current_user ||= User.find_by_id(session[:user_id])
      #@current_user = nil || User.find_by_id(session[:user_id])
     
    end
  end

  def logged_in?
    !current_user.nil?
  end
end