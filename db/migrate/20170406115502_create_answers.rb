class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.belongs_to :question, index: true
      t.integer :responder_id
      t.string :answer
    end
  end
end
