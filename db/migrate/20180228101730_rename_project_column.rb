class RenameProjectColumn < ActiveRecord::Migration[5.2]
  def change
    rename_column :projects, :user_id_id, :user_id
  end
end
