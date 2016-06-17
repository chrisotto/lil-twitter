get '/tweet/new' do
  erb :'tweet/new'
end

post '/tweet' do
  @user = User.find(session[:id])
  @tweet = Tweet.new( body: params[:tweet][:body], user_id: session[:id])
  if @tweet.save
    redirect "/users/#{@user.id}"
  else
    erb :'tweet/new'
  end
end

get '/tweet/:id' do
  @tweet = Tweet.find(params[:id])
  erb :'tweet/show'
end

get '/tweet/:id/edit' do
  @tweet = Tweet.find(params[:id])
  erb :'tweet/edit'
end

put '/tweet/:id' do
  @user =User.find(session[:id])
  @tweet = Tweet.find(params[:id])
  @tweet.assign_attributes( body: params[:tweet][:body], user_id: session[:id])
  if @tweet.save
    redirect "/users/#{@user.id}"
  else
    erb :'tweet/edit'
  end
end

delete '/tweet/:id' do
  @user =User.find(session[:id])
  @tweet = Tweet.find(params[:id])
  @tweet.destroy
  redirect "/users/#{@user.id}"
end
