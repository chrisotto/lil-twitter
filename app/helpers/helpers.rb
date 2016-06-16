helpers do
  def current_user
    {id: 1, username: 'Chris Otto', email: 'cotto@yahoo.com'} # TODO once model exists, replace with User.find(session[:id]) if session[:id]
  end
end
