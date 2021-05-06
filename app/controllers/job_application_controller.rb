class JobApplicationController < ApplicationController
  before_action :set_job_application, only: %i[ show edit update destroy ]
  before_action :authenticate_user!

  def index
      authorize JobApplication
    @job_applications = JobApplication.all
  end

  def show
  end

  def new
    @job_application = JobApplication.new
  end

  def edit
  end

  def create
    @job_application = JobApplication.new(job_params)
    respond_to do |format|
      if @job_application.save
        format.html { redirect_to @job, notice: "Job was successfully created." }
        format.json { render :show, status: :created, location: @job_application }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @job_application.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @job_application.update(job_params)
        format.html { redirect_to @job_application, notice: "Job was successfully updated." }
        format.json { render :show, status: :ok, location: @job_application }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @job_application.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @job_application.destroy
    respond_to do |format|
      format.html { redirect_to job_applications_url, notice: "Job was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job_application
      @job_application = JobApplication.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def job_application_params
      params.require(:job_application).permit(:user_id, :job_id, :role, :username)
    end

end