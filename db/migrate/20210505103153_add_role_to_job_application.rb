class AddRoleToJobApplication < ActiveRecord::Migration[6.1]
  def change
    add_column :job_applications, :role, :string
  end
end
