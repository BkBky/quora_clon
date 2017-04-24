get '/like/' do

  question_id = params[:question_id]
  p question_id
  p "en like question"
  # if request.xhr?
    @user_login = current_user.name
    @question = Question.all
    quest_vote = QuestionVote.new(question_id: question_id, like: 1, unlike: 0, user_id: current_user.id)
   
    if quest_vote.save
      @quest_like = QuestionVote.where(question_id: question_id).where(like: 1).count
      p @quest_like
      p "arriba esta todos contados"
      erb :_votes, layout: true
    end
  #end
end

get '/unlike/' do
  question_id = params[:question_id]
  p question_id
  p "en UNlike question"

  @user_login = current_user.name
  @question = Question.all
  quest_vote = QuestionVote.new(question_id:question_id, like: 0, unlike: 1, user_id: current_user.id)
  if quest_vote.save
    @quest_unlike = QuestionVote.where(question_id: question_id).where(unlike: 1).count
    p @quest_unlike
    p "arriba esta todos contados"
    erb :_votes, layout: true
  end
end
get '/like_ans/:ans_id' do
  answer_id = params[:ans_id]
  p answer_id
  p "en like answer"

  # @user_login = current_user.name
  # @question = Question.all
  answer_vote = AnswerVote.new(answer_id:answer_id, like: 1, unlike: 0, user_id: current_user.id)
  if answer_vote.save
     
     p "dentro del answer vote2"
     current_ans = Answer.find(answer_id)
     p current_quest = current_ans.question_id
     @quest_id = Question.where(id: current_quest)
     @user_login = current_user.name
     erb :show_question  



     # redirect to "/show_question/#{currest_quest}"
     # erb :show_question
  end
end

get '/unlike_ans/:ans_id' do
  answer_id1 = params[:ans_id]
  p answer_id1
  p "en UNlike answer"

  # @user_login = current_user.name
  # @question = Question.all
  answer_vote1 = AnswerVote.new(answer_id:answer_id1, like: 0, unlike: 1, user_id: current_user.id)
   current_ans1 = Answer.find(answer_id1)
     p current_quest1 = current_ans1.question_id
     @quest_id = Question.where(id: current_quest1)
     @user_login = current_user.name
     
  if answer_vote1.save
     
     p "dentro del answer vote3"
     erb :show_question 



     # redirect to "/show_question/#{currest_quest}"
     # erb :show_question
  end
end
