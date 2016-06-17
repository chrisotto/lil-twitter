get '/' do
  if current_user
    redirect "/users/#{current_user.id}"
  else
    erb :'index'
  end
end

post '/login' do
  @user = User.authenticate(params[:user])
  if @user
    session[:id] = @user.id
    redirect "/users/#{@user.id}"
  else
    # TODO: pass errors to erb
    erb :'index'
  end
end
