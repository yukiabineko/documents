class CreateDocuments < ActiveRecord::Migration[5.1]
  def change
    create_table :documents do |t|
      t.string :title
      t.text :memo
      t.text :pdf_link
      t.date :deadline
      t.integer :user_id
      t.string :randam
      t.timestamps
    end
  end
end
