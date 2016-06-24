get '/sessions/login' do
    # binding.pry

  erb :'users/login'
end

post '/sessions' do
  # binding.pry
  @user = User.find_by(email: params[:user][:email])
  if @user && @user.authenticate(params[:user][:password])
    session[:user_id] = @user.id
    redirect '/questions'
  else
    @errors = @user.errors.full_messages
    erb :'questions/login'
  end
end


get '/sessions/logout' do
  session.clear
  redirect '/questions'
end
