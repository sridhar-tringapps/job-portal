# frozen_string_literal: true

json.extract! @job, :role, :description, :count

json.users @job.users, :email

json.partial! 'job_application/job_application.json.jbuilder', applicants: @job.job_applications
