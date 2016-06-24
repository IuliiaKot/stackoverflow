post '/answers/:id/upvote' do
  require_user
  binding.pry
  answer = Answer.find_by(id: params[:id])
  vote = answer.votes.create(user_id: current_user.id)
  if request.xhr?
    content_type :json
    {vote: answer.votes.count}.to_json
  else
  # if vote.save
  #   redirect "/questions/#{answer.question.id}"
  # else
    redirect "/questions/#{answer.question.id}"
  end
end
