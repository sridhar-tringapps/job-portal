# frozen_string_literal: true

class JobsController < ApplicationController
  before_action :set_job, only: %i[show edit update destroy]

  # GET /jobs or /jobs.json
  def index
    @jobs = Job.all.includes([:job_applications])
  end

  # GET /jobs/1 or /jobs/1.json
  def show 
  end

  # GET /jobs/new
  def new
    @job = Job.new
  end

  # GET /jobs/1/edit
  def edit
  end

  # POST /jobs or /jobs.json
  def create
    @job = Job.new(job_params)
    respond_to do |format|
      if @job.save
        format.html { redirect_to @job, notice: 'Job was successfully created.' }
        format.json { render :show, status: :created, location: @job }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /jobs/1 or /jobs/1.json
  def update
    respond_to do |format|
      if @job.update(job_params)
        format.html { redirect_to @job, notice: 'Job was successfully updated.' }
        format.json { render :show, status: :ok, location: @job }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /jobs/1 or /jobs/1.json
  def destroy
    @job.destroy
    respond_to do |format|
      format.html { redirect_to jobs_url, notice: 'Job was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def apply
    puts current_user.id
    job_id = params[:job_id]
    job_role = params[:job_role]
    puts job_id
    @user = current_user
    puts current_user.email
    puts current_user.name
    JobApplication.create(user_id: current_user.id, job_id: job_id, role: job_role, username: current_user.name)

    JobMailer.new_job.deliver_later
    flash[:notice] = 'Congratulations! You have successfully applied'

    redirect_to jobs_url
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_job
    @job = Job.friendly.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def job_params
    params.require(:job).permit(:id, :role, :description, :count)
  end
end
