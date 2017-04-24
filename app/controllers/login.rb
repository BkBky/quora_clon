#'enable' the hash session for authenticate
enable :sessions

before '/secret' do
  unless session[:user_id]
    session[:error] = "You are not logged"
    #I need to redirect to index to avoid go to /secret again
    redirect to '/'
  end
end

get "/secret" do
  @user_login = current_user.name
  @question = Question.all
  
  erb :secret
end


# Post for login
post '/login_form' do
  #I Obtain user inputs
  @email = params[:email]
  @password = params[:password]
   
  #I send the user input to models/user.rb to compare with database for authenticate
  valid_user = User.authenticate(@email, @password)
  if valid_user
    p session[:user_id] = valid_user.id
    redirect to "/secret"
  else
    session[:error] = "incorrect email and/or password"
    #@error_message_login = "Email y/o password incorrectos"
    redirect to '/'
  end
end

#url for logout
get '/logout' do
  #I need to clear session to be clean it.
  session.clear
  session[:logoutm] = "You Loggout correctly"
  redirect to '/'
end