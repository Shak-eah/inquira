class QuestionUpvoteSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :question_id
end
