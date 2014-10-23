class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :name
      t.text :description
      t.string :link
      t.string :kind
      t.string :time_spent

      t.timestamps
    end
  end
end
