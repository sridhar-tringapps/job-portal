class Api::V1::JobsController < Api::ApplicationController
  
  before_action :set_job, only: %i[ show edit update destroy ]

  def index
    @jobs = Job.all
  end

  def show
    # render json: @job
  end


  def create
    @job = Job.new(job_params)

    if @job.save
      render json: @job, status: :created, location: @job
    else
      render json: @job.errors, status: :unprocessable_entity
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

  def set_job
    @job = Job.find(params[:id])
  end
  
    def job_params
    params.require(:job).permit(:role, :description, :count)
    end
  end
  