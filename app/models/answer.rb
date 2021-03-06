class Answer < ActiveRecord::Base
	belongs_to :question
	# has_many :upvotes, :foreign_key => 'answer_id', :class_name => 'AnswerUpvote'
	# has_many :downvotes, :foreign_key => 'answer_id', :class_name => 'AnswerDownvote'
	has_many :answer_upvotes, dependent: :destroy
	has_many :answer_downvotes, dependent: :destroy

	# def num_upvotes
	# 	self.upvotes.count
	# end

	# def num_downvotes
	# 	self.downvotes.count
	# end
end
