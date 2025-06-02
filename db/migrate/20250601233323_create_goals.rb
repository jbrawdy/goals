class CreateGoals < ActiveRecord::Migration[8.0]
  def change
    create_table :goals do |t|
      t.string :goal
      t.text :details
      t.datetime :date
      t.boolean :accomplished

      t.timestamps
    end
  end
end
