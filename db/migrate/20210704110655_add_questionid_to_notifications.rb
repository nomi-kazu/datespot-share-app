class AddQuestionidToNotifications < ActiveRecord::Migration[6.0]
  def change
    add_column :notifications, :question_id, :integer
    add_column :notifications, :answer_id,   :integer
  end
end
