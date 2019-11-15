class CreateDocumentSelects < ActiveRecord::Migration[5.1]
  def change
    create_table :document_selects do |t|
      t.text :content
      t.integer :select_number
      t.integer :document_item_id
      t.string :randam
      t.timestamps
    end
  end
end
