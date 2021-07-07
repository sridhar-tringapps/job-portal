class AddImageToJobs < ActiveRecord::Migration[6.1]
  def change
    add_column :jobs, :image, :string
  end
end
