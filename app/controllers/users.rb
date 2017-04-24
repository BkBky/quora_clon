get "/show_users" do
  @user_login = current_user.name
  @users = User.all
  erb :all_users
end

#view update profile user 
get "/update/:id" do
  @user_login = current_user.name
  @edit = User.find(params[:id])
  erb :update_profile
end

#update table user with current user
post "/update/:id" do
 p "está en post update"
 user = User.find(params[:id])
 values = []
 name = params[:name]
 email = params[:email]
 password = params[:password]
 #two ways to update values if user did or didn´t save a new password
 if password != ""
   user.update(name: name, email: email, password: password)
   session[:successfull] = 'Successfull updated'
   redirect to "/update/#{user.id}"
 else
   user.update(name: name, email: email)
   session[:successfull] = 'Successfull updated'
   redirect to "/update/#{user.id}"
 end

end