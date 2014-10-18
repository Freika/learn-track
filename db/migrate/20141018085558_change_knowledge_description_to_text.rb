class ChangeKnowledgeDescriptionToText < ActiveRecord::Migration
  def change
    change_column :knowledges, :description, :text
  end
end
