class AddTemplateToTask < ActiveRecord::Migration[5.1]
  def change
    add_column :tasks, :template, :text
  end
end
