class Api::V1::JobsController < ApplicationController

    def index
      jobs = Job.all
      render json: jobs, only: [:role, :description, :count], status: 200
    end
  
    def create
      job = Job.new(
        id: job_params[:id],
        role: job_params[:role],
        description: job_params[:description],
        count: job_params[:count]
      )
      if job.save
        render json: job, status: 200
      else
        render json: {error: "Error creating job"}
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
  
    def destroy
      @job = job.find(params[:id])
      if @job
        @job.destroy
        render json: { message: 'job deleted sucessfully'},status: 200
      else
        render json: { error: 'Unable to delete'},status: 400
      end
  
    end
  
  
    private
      def job_params
        params.permit([
          :role,
          :description,
          :count
        ])
      end
  end
  