class Job < ApplicationRecord
    has_many :job_applications
    has_many :users, through: :job_applications

    def has_applied?(user,job_id)
        @user = user.id
        @job = job_id
        if JobApplication.where(user_id: @user, job_id: @job).any?
            errors.add(:user_id, "You have already applied")
        end
    end


end
