def current_user
  @current_user = User.find_by(id: session[:user_id])
end

def login?
  session[:user_id]
end


def require_user
    # binding.pry
  redirect '/sessions/login' unless login?
end
