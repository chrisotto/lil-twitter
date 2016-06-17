get '/users/new' do
  erb :"/user/new"
end

get '/users' do
  @users = User.all.order(:name)
  erb :'/user/index'
end

post '/users' do
  @user = User.new(params[:user])
  if @user.save
    session[:id] = @user.id
    redirect "/users/#{@user.id}"
  else
    erb :'/user/new'
  end
end

get '/users/:id' do
  @user = User.find(params[:id])
  @tweets = @user.tweets.sort{|tweet_1, tweet_2| tweet_2.created_at <=> tweet_1.created_at }
  erb :"user/show"
end

get '/users/:id/followers' do
  @followers = @user.follower_id
  erb :"followers/show"
end

get '/users/:id/followees' do
  @followees = @user.followee_id
  erb :"followees/show"
end




