

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

get '/account/:id' do
  #if session cookie == :id
   # go to taht user's page
   #else
   #redirect to index
end



# POST =======================================


# post '/account' do

#   redirect "/account/#{user.id}"
# end

post '/create' do
  if verify_password(params[:create][:password],
                     params[:verify][:password])
    @user = User.create(params[:create])
    redirect "/account/#{user.id}"
  else
    redirect '/'
  # Validate and create a new user
  # Set a session value to user's id
  end
end
