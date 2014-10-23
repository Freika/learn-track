class ChangeTimeSpendAttributeInActivity < ActiveRecord::Migration
  def change
    change_column :activities, :time_spent, 'integer USING CAST(time_spent AS integer)'
  end
end
