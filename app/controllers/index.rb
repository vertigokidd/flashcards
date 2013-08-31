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
  @card = deck.shuffle.first
  round = Round.create(user_id: session[:id], deck_id: params[:deck_id])
  session[:round] = round.id
  erb :card
end


get '/account/profile/:id' do
  if session[:id] != params[:id].to_i
    redirect '/'
  end
  @decks = Deck.all
  @user = User.find(params[:id])
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
      if @user.errors.any?
        erb :index 
      else
        session[:id] = @user.id
        redirect "/account/profile/#{@user.id}"
      end
    else
    redirect '/'
  end
end














post '/round' do
  session[:round]
  params[:guess]
  params[:card_id]
  p session[:round]
  round = Round.find(session[:round])
  if params[:guess].downcase == Card.find(params[:card_id]).answer.downcase
    round.update_stats(1, 1)
  else
    round.update_stats(1, 0)
  end

    #LOGIC HERE
  # Takes the deck
  # Checks to see what round it is
  # Checks what cards have been displayed this round
  # Only displays cards that are left


end



