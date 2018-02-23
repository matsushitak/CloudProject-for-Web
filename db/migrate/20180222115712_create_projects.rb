class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.string :title
      t.string :image_name
      t.string :overview
      t.integer :category
      t.date :recruitment_date_start
      t.date :recruitment_date_finish
      t.integer :people_count_goal
      t.string :text
      t.references :user_id, foreign_key: true

      t.timestamps
    end
  end
end
