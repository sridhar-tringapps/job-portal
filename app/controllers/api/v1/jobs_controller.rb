class Api::V1::JobsController < Api::ApplicationController

    def index
      jobs = Job.all
      render json: jobs, only: [:role, :description, :count], status: 200
    end

    def create
      @job = Job.new(job_params)
  
      if @job.save
        render json: @job, status: :created, location: @job
      else
        render json: @job.errors, status: :unprocessable_entity
      end
    end
  
    def show
      @job = Job.find_by(id: params[:id])
      if @job
        render json: @job, status: 200
      else
        render json: {error: "job not found"}
      end
    end

    def update
      if @job.update(job_params)
        render json: @job
      else
        render json: @job.errors, status: :unprocessable_entity
      end
    end
  
    def destroy
      @job.destroy
    end
  
  
    private
      def job_params
      params.require(:job).permit(:role, :description, :count)
      end
  end
  