class CreateQuestionnaires < ActiveRecord::Migration[4.2][4.2]
  def self.up
  create_table "questionnaires", :force => true do |t|
    t.column "name", :string, :limit => 64 # the name of the questionnaire
    t.column "instructor_id", :integer, :default => 0, :null => false # the id of the instructor (as user) who created the questionnaire
    t.column "private", :boolean, :default => false, :null => false # is the questionnaire private?
    t.column "min_question_score", :integer, :default => 0, :null => false # the lowest possible score on a question
    t.column "max_question_score", :integer # the greatest possible score on a question
    t.column "created_at", :datetime # when the questionnaire was created - generated by Ruby
    t.column "updated_at", :datetime, :null => false # when the questionnaire was last updated - generated by Ruby
    t.column "default_num_choices", :integer # default number of scoring increments
    t.column "type_id", :integer, :default => 1, :null => false # Questionnaire Type join
  end

  add_index "questionnaires", ["type_id"], :name => "fk_questionnaire_type"
  
  execute "alter table questionnaires 
             add constraint fk_questionnaire_type
             foreign key (type_id) references questionnaire_types(id)"
  
  end

  def self.down
    drop_table "questionnaires"
  end
end
