# frozen_string_literal: true

json.extract! job, :id, :role, :description, :count, :created_at, :updated_at
json.url job_url(job, format: :json)
