class ChangeAnswerToOptionalForResponses < ActiveRecord::Migration[7.0]
  def change
    change_column :responses, :answer_id, :bigint, null: true
  end
end
