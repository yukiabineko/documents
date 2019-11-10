class CreateDocuments < ActiveRecord::Migration[5.1]
  def change
    create_table :documents do |t|
      t.string :title
      t.text :memo
      t.text :pdf_link
      t.date :deadline

      t.timestamps
    end
  end
end
