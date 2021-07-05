# frozen_string_literal: true

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
    @job.destroy if @job.count.zero?
  end
end
