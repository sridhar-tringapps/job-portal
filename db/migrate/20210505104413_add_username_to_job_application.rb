class AddUsernameToJobApplication < ActiveRecord::Migration[6.1]
  def change
    add_column :job_applications, :username, :string
  end
end
