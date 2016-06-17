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
