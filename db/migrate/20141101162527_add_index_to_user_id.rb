class AddIndexToUserId < ActiveRecord::Migration
  def change
    add_index :activities, :user_id
  end
end
