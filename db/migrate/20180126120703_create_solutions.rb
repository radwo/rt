class CreateSolutions < ActiveRecord::Migration[5.1]
  def change
    create_table :solutions do |t|
      t.belongs_to :task
      t.string :input
      t.string :output

      t.timestamps
    end
  end
end
