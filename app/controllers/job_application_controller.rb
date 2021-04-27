class JobApplicationController < ApplicationController
    before_action :find_job
    before_action :find_job_application, only: [:destroy]

    def create
        if already_applied?
            flash[:notice] = "Already applied"
        else
            @job.job_applications.create(user_id: current_user.id)
        end
        redirect_to job_path(@job)
    end

    def find_job
        @job = Job.find_by(id: params[:id])
    end

    def already_applied?
        JobApplication.where(user_id: current_user.id, job_id: params[:job_id])exists?
    end

    def find_job_application
        @job_application = @job.job_applications.find(params[:id])
    end
end
