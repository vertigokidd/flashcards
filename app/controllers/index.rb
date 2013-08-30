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
  if session[:id] != params[:id].to_i
    redirect '/'
  end
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
        # redirect to '/'
        # erb :index
        # break
        erb :index 
      else
        session[:id] = @user.id
        redirect "/account/profile/#{@user.id}"
      end
    else
    redirect '/'
  end
end
