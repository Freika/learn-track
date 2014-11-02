class AddApprovedToKnowledge < ActiveRecord::Migration
  def change
    add_column :knowledges, :approved, :boolean
  end
end
