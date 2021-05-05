class UsersController < ApplicationController
    before_action :set_user, only: %i[ show edit update destroy ]
  
    # GET /jobs or /jobs.json
    def index
      @users = User.all
    end
  
    # GET /jobs/1 or /jobs/1.json
    def show
    end
  
    # GET /jobs/new
    def new
      @user = Users.new
    end
  
    # GET /jobs/1/edit
    def edit
    end
  
    # POST /jobs or /jobs.json
    def create
      @user = User.new(job_params)
  
      respond_to do |format|
        if @user.save
          format.html { redirect_to @user, notice: "User was successfully created." }
          # format.json { render :show, status: :created, location: @job }
        else
          format.html { render :new, status: :unprocessable_entity }
          # format.json { render json: @job.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # PATCH/PUT /jobs/1 or /jobs/1.json
    def update
      respond_to do |format|
        if @user.update(user_params)
          format.html { redirect_to @user, notice: "User was successfully updated." }
          format.json { render :show, status: :ok, location: @user }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # DELETE /jobs/1 or /jobs/1.json
    def destroy
      @user.destroy
      respond_to do |format|
        format.html { redirect_to users_url, notice: "User was successfully destroyed." }
        format.json { head :no_content }
      end
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_user
        @user = User.find(params[:id])
      end
  
      # Only allow a list of trusted parameters through.
      def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
      end
  end