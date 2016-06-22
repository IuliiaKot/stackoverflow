get '/sessions/login' do
  erb :'users/login'
end

post '/sessions' do
  @user = User.find_by(email: params[:email])
  if @user && @user.authenticate(params[:password])
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
