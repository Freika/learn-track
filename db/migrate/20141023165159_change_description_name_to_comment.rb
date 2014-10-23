class ChangeDescriptionNameToComment < ActiveRecord::Migration
  def change
    rename_column :activities, :description, :comment
  end
end
