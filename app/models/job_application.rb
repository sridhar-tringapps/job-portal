class JobApplication < ApplicationRecord
    belongs_to :user  
    belongs_to :job

    validates :user_id, presence: true
    validates :job_id, presence: true
    after_commit :job_count

    def job_count
        @job = Job.find(job_id)
        @job.count -= 1
        @job.save
        if @job.count == 0
            @job.destroy
        end
    end
end
