# frozen_string_literal: true

class Job < ApplicationRecord
  has_many :job_applications
  has_many :users, through: :job_applications

  extend FriendlyId
  friendly_id :role, use: :slugged

  def has_applied?(user, job_id)
    @user = user.id
    @job = job_id
    errors.add(:user_id, 'You have already applied') if JobApplication.where(user_id: @user, job_id: @job).any?
  end
end
