get '/profile' do
  # La siguiente linea hace render de la vista 
  # que esta en app/views/index.erb
  p "anest del @profile"
  @user_login = current_user.name
  p @profile_user = User.where(id: current_user.id)
  erb :profile
end


