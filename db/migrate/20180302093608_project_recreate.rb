class ProjectRecreate < ActiveRecord::Migration[5.2]
  def change
    drop_table :projects
    create_table :projects do |t|
      t.string :title
      t.string :image_name
      t.text :overview
      t.date :recruitment_date_start
      t.date :recruitment_date_finish
      t.integer :target_number_of_people
      t.text :text

      t.timestamps
    end
    add_reference :projects, :user, index: true
  end
end
