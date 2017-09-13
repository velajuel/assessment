class DoctorsController < ApplicationController

	 before_action :set_doctor, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @doctors = Doctor.all
  end

  # GET /users/1
  # GET /users/1.json
  def show2
  end

  # GET /users/new
  def new
    @doctor = Doctor.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    
    @doctor = Doctor.new(doctor_params)
    redirect_to doctors_path
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @doctor.update(doctor_params)
        format.html { redirect_to @doctor, notice: 'Doctor was successfully updated.' }
        format.json { render :show, status: :ok, location: @doctor }
      else
        format.html { render :edit }
        format.json { render json: @pdoctor.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @doctor.destroy
    respond_to do |format|
      format.html { redirect_to doctors_url, notice: 'Doctor was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_doctor
      @doctor = Doctor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def doctor_params
      params.permit(:name, :email, :password, :location, :registration_number, :min_rate, :max_rate, :opening_hours)
      # params.require(:patients).permit(:name, :email, :password)

    end

end
