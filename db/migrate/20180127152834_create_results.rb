class CreateResults < ActiveRecord::Migration[5.1]
  def change
    create_table :results do |t|
      t.string :expected
      t.string :output
      t.boolean :done
      t.references :attempt, foreign_key: true

      t.timestamps
    end
  end
end
