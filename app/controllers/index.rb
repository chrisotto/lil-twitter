get '/' do
  if current_user
    redirect "/users/#{current_user[:id]}" # TODO: change hash references to attribute references
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
    @errors = @user.errors.full_messages
    erb :'index'
  end
end
