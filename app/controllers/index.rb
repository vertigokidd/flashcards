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
  @rounds = @user.rounds
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

  round = Round.find(session[:round])
  current_deck_id = Card.find_by_id(params[:card_id].to_i).deck_id
  card_id_array = Deck.find(current_deck_id).cards.map { |card| card.id }
  if params[:guess].downcase == Card.find(params[:card_id]).answer.downcase
    round.update_stats(1, 1)
    Guess.create(round_id: round.id, card_id: params[:card_id].to_i, correctness: true)
  else
    round.update_stats(1, 0)
    Guess.create(round_id: round.id, card_id: params[:card_id].to_i, correctness: false)
  end

  used_card_array = Guess.where(round_id: round.id).map { |card| card.card_id }
  remaining_cards = card_id_array - used_card_array

  if remaining_cards.empty?
    redirect "/account/summary/#{session[:id]}"
  else
    @card = Card.find(remaining_cards.sample)
    erb :card
  end

end



