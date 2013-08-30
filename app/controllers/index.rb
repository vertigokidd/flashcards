# GET ========================================


get '/' do
  # Look in app/views/index.erb
  erb :index
end


get '/account/:id' do
  #if session cookie == :id
   # go to taht user's page
   #else
   #redirect to index
end


get '/card/:card_id' do
  erb :card
end




# POST =======================================


post '/account' do

  redirect "/account/#{user.id}"
end

post '/create' do
  # Validate and create a new user
  # Set a session value to user's id
  redirect "/account/#{user.id}"
end
