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

get '/round/:deck_id' do
  deck = Deck.find(params[:deck_id]).cards
  @deck = deck.shuffle
  erb :card
end


get '/account/profile/:id' do
  if session[:id] != params[:id].to_i
    redirect '/'
  end
  @decks = Deck.all
  erb :profile
end

get '/logout' do
  session[:id] = nil
  redirect '/'
end




# POST =======================================


post '/account' do
  if User.validate(params[:user][:email], params[:user][:password])
    @user = User.find_by_email(params[:user][:email])
    session[:id] = @user.id
    redirect "/account/profile/#{@user.id}"
  else
    redirect '/'
  end
end

post '/create' do
  if verify_password(params[:create][:password],
                     params[:verify][:password])
    @user = User.create(params[:create])
    session[:id] = @user.id
    redirect "/account/profile/#{@user.id}"
  else
    redirect '/'
  end
end













post '/round' do
  deck = Deck.find(params[:deck])

end


