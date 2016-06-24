get '/questions' do
  @questions = Question.all
  erb :'questions/index'
end


get '/questions/new' do
  require_user
  erb :'questions/new'
end


post '/questions' do
  question = current_user.questions.new(params[:question])
  if question.save
    redirect '/questions'
  else
    @errors = question.errors.full_messages
    erb :'questions/new'
  end
end

get '/questions/:id' do
  @question = Question.find(params[:id])
  erb :'questions/show'
end


post '/questions/:id/answers' do
  # binding.pry
  @answer = Question.find(params[:id]).answers.new(body: params[:answer][:body], user_id: current_user.id)
  if @answer.save
    if request.xhr?
      erb :'answers/_answer', layout: false, locals: {answer: @answer}
    else
      redirect "/questions/#{params[:id]}"
    end
  else
    @errors = @answer.errors.full_messages
    erb :'questions/show'
  end
end


post '/questions/:id/upvote' do
  require_user
  # binding.pry
  question = Question.find_by(id: params[:id])
  vote = question.votes.create(user_id: current_user.id)

  redirect "/questions"
  # end
end
