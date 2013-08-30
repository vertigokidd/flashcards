enable :sessions

# GET ========================================


get '/' do
  # Look in app/views/index.erb
  erb :index
end


get '/card/:card_id' do
  erb :card
end

get '/account/summary/:id' do
  erb :summary
end

get '/account/profile/:id' do
  if session[:id] == params[:id]
   # go to taht user's page
  else
   redirect '/'
  end
  erb :profile
end

get '/logout' do
  session[:id] = nil
  redirect '/'
end


# POST =======================================


post '/account' do
  if

  redirect "/account/profile/#{user.id}"
end

post '/create' do
  if verify_password(params[:create][:password],
                     params[:verify][:password])
    @user = User.create(params[:create])
    session[:id] = @user.id
    redirect "/account/profile/#{@user.id}"
  else
    redirect '/'
  # Validate and create a new user
  # Set a session value to user's id
  end
end
