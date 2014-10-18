class CreateKnowledges < ActiveRecord::Migration
  def change
    create_table :knowledges do |t|
      t.string :name
      t.string :description
      t.string :link
      t.string :kind

      t.timestamps
    end
  end
end
