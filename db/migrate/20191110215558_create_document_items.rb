class CreateDocumentItems < ActiveRecord::Migration[5.1]
  def change
    create_table :document_items do |t|
      t.text :content
      t.integer :document_id
      t.string :randam
      t.timestamps
    end
  end
end
