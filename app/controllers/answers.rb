post '/answers/:id/upvote' do
  require_user
  answer = Answer.find_by(id: params[:id])
  vote = answer.votes.create(user_id: current_user.id)
  if request.xhr?
    content_type :json
    {vote: answer.votes.count}.to_json
  else
    redirect "/questions/#{answer.question.id}"
  end
end


get '/answers/:id/comments/new' do
  @answer = Answer.find_by(id: params[:id])
  erb :'comments/new', layout: false
end



post '/answers/:id/comments' do
  binding.pry
  answer = Answer.find_by(id: params[:id])
  comment = answer.comments.new(params[:comment])
  if comment.save
    if request.xhr?
    else
      redirect "/questions/#{answer.question.id}"
    end
  else
  end
end
