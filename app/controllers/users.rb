get '/users/new' do
  erb :"/user/new"
end

post '/users' do
  p params
  p "4" * 5
  @user = User.new(params[:user])
  if @user.save
    session[:id] = @user.id

    redirect "/users/#{@user.id}"
  else
    erb :'/user/new'
  end
end

get '/users/:id' do

  @user =User.find(params[:id])
  @tweets = @user.tweets.sort{|tweet_1, tweet_2| tweet_2.created_at <=> tweet_1.created_at }
  erb :"user/show"
end



