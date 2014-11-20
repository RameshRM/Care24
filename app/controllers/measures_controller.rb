require 'json'

class MeasuresController < ApplicationController
  before_action :set_measure, only: [:show, :edit, :update, :destroy]
  
  def get_msg
    # call message web api to get the data
    # if there is new data, store in measures and send to client
    to = params[:to]
    from = params[:from]
    message = Message.where({to: to, from: from, retrieved: false}).limit(1).first
    if message != nil
      message[:retrieved] = true
      message.save
      
      # update measures
      @patient = Patient.find(params[:patient_id])
      @measure = @patient.measures.create
      #measure.data=JSON.parse(message.body)
      @measure.name="Msg from pt " + message.body[0..5]
      @measure.data=message.body
      @measure.save
      render :json=>@measure
    else
      render :json=>nil
    end
  end
  
  
  # GET /measures
  # GET /measures.json
  def index
    @patient = Patient.find(params[:patient_id])
    @measures = @patient.measures.order("created_at DESC")
  end

  # GET /measures/1
  # GET /measures/1.json
  def show
    @patient = Patient.find(params[:patient_id])
  end

  # GET /measures/new
  def new
    @patient = Patient.find(params[:patient_id])
    @measure = @patient.measures.create
    #@measure = Measure.new
    
  end

  # GET /measures/1/edit
  def edit
    @patient = Patient.find(params[:patient_id])
  end

  # POST /measures
  # POST /measures.json
  def create
    @patient = Patient.find(params[:patient_id])
    @measure = Measure.new(measure_params)

    respond_to do |format|
      if @measure.save
        format.html { redirect_to patient_measures_path(@patient), notice: 'Measure was successfully created.' }
        format.json { render :show, status: :created, location: @measure }
      else
        format.html { render :new }
        format.json { render json: @measure.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /measures/1
  # PATCH/PUT /measures/1.json
  def update
    @patient = Patient.find(params[:patient_id])
    respond_to do |format|
      if @measure.update(measure_params)
        format.html { redirect_to patient_measure_path(@patient, @measure), notice: 'Measure was successfully updated.' }
        format.json { render :show, status: :ok, location: @measure }
      else
        format.html { render :edit }
        format.json { render json: @measure.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /measures/1
  # DELETE /measures/1.json
  def destroy
    @measure.destroy
    respond_to do |format|
      format.html { redirect_to patient_measures_url, notice: 'Measure was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_measure
      @measure = Measure.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def measure_params
      params.require(:measure).permit(:patient_id, :type, :name, :data)
    end
end
