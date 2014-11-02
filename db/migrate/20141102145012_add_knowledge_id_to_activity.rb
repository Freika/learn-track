class AddKnowledgeIdToActivity < ActiveRecord::Migration
  def change
    add_column :activities, :knowledge_id, :integer
  end
end
