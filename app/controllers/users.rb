get '/users/new' do
  erb :"/user/new"
end

post '/users' do
  @user = User.new(params[:user])
  if @user.save
    session[:id] = @user.id
    redirect "/users/#{@user.id}"
  else
    erb :'users/new'
  end
end

get '/users/:id' do
  @user =User.find(params[:id])
  erb :"user/show"
end


