class CreateJobs < ActiveRecord::Migration[6.1]
  def change
    create_table :jobs do |t|
      t.string :role
      t.string :description
      t.integer :count

      t.timestamps
    end
  end
end
