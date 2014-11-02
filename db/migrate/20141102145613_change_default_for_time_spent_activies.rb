class ChangeDefaultForTimeSpentActivies < ActiveRecord::Migration
  def change
    change_column :activities, :time_spent, :integer, default: 0
  end
end
