class CreateTeamDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :team_details do |t|
      t.integer :experience
      t.integer :beginner
      t.integer :male
      t.integer :female
      t.text :introduction
      t.string :team_level
      t.string :active_area
      t.string :active_time
      t.integer :user_id

      t.timestamps
    end
  end
end
