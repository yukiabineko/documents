class CreateAnswers < ActiveRecord::Migration[5.1]
  def change
    create_table :answers do |t|
      t.text :reply
      t.integer :document_id

      t.timestamps
    end
  end
end
