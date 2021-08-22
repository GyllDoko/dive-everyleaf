class ChangeColumnNullTasks < ActiveRecord::Migration[5.2]
  change_column :tasks, :name, :string, null: false
  change_column :tasks, :content, :text, null: false
end
