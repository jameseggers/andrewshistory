class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit, :update, :destroy]

  # GET /students
  # GET /students.json
  def index
    filter_params = student_params
    filter_params.except! :age unless filter_params[:age].length > 0
    filter_params.except! :registerNumber unless filter_params[:registerNumber].length > 0

    if filter_params[:address].length > 0
      students = Student.where(filter_params.except(:address, :pupilForname, :pupilSurname)).where("to_tsvector('english', \"pupilAddress\") @@ plainto_tsquery('english', '#{filter_params[:address]}')")
    else
      students = Student.where(filter_params.except(:address, :pupilForname, :pupilSurname))
    end
    t = Student.arel_table
    students = students.where(t[:pupilForname].matches(filter_params[:pupilForname])) if filter_params[:pupilForname].length > 0
    students = students.where(t[:pupilSurname].matches(filter_params[:pupilSurname])) if filter_params[:pupilSurname].length > 0

    render json: students
  end

  # GET /students/1
  # GET /students/1.json
  def show
    render json: Student.find(params[:id])
  end

  # GET /students/new
  def new
    @student = Student.new
  end

  # GET /students/1/edit
  def edit
  end

  # POST /students
  # POST /students.json
  def create
    @student = Student.new(student_params)

    respond_to do |format|
      if @student.save
        format.html { redirect_to @student, notice: 'Student was successfully created.' }
        format.json { render :show, status: :created, location: @student }
      else
        format.html { render :new }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /students/1
  # PATCH/PUT /students/1.json
  def update
    respond_to do |format|
      if @student.update(student_params)
        format.html { redirect_to @student, notice: 'Student was successfully updated.' }
        format.json { render :show, status: :ok, location: @student }
      else
        format.html { render :edit }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /students/1
  # DELETE /students/1.json
  def destroy
    @student.destroy
    respond_to do |format|
      format.html { redirect_to students_url, notice: 'Student was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student
      @student = Student.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def student_params
      params.permit(:age, :registerNumber, :pupilForname, :pupilSurname, :pupilAddress, :parentSurname, :parentsOccupation, :pupilReligion, :monthlyAttendanceTotal, :yearlyAttendanceTotal, :additionalNotes, :address)
    end
end
