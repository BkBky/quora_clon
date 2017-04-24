class CreateQuestionVotes < ActiveRecord::Migration
  def change
    create_table :question_votes do |t|
      t.belongs_to :question, index: true
      t.belongs_to :user, index: true
      t.integer :like
      t.integer :unlike
    end
  end
end
