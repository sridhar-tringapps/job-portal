# frozen_string_literal: true

class JobMailer < ApplicationMailer
  def new_job
    @apply = JobApplication.last
    mail to: @apply.email, subject: 'Thank you for your application'
  end
end
