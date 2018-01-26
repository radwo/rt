class CreateAttempts < ActiveRecord::Migration[5.1]
  def change
    create_table :attempts do |t|
      t.text :code
      t.boolean :final
      t.references :task

      t.timestamps
    end
  end
end
