get '/' do
  # Look in app/views/index.erb
  erb :index
end

get '/sign_in' do
  redirect request_token.authorize_url
end

get '/sign_out' do
 session.clear
 redirect '/'
end


get '/auth' do
  @access_token = request_token.get_access_token(oath_verifier: params[:oauth_verifier])
  session.delete(:request_token)
  
  @user = User.where(username: @access_token.params[:screen_name]).first_or_create
  @user.update_attributes(oauth_token: @access_token.token,
                          oath_secret: @access_token.secret)

  session[:user_id] = @user.id
  erb :index
end


post '/tweet' do
  job_id = current_user.tweet(params[:tweet])
  content_type :json
  {status: job_id}.to_json
end
