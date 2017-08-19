class SurveysController < ApplicationController
  before_action :set_survey, only: [:show, :edit, :update, :destroy]

  # GET /surveys
  # GET /surveys.json
  def index
    @surveys = Survey.all
    if params[:q].present?
      @surveys = @surveys.search(params[:q])
    end
    if params[:from].present?
      @surveys = @surveys.where("date >= ?", params[:from])
    end
    if params[:to].present?
      @surveys = @surveys.where("date <= ?", params[:to])
    end    
    if params[:district].present?
      @surveys = @surveys.where(district: params[:district])
    end
    if params[:road_class].present?
      @surveys = @surveys.where(road_class: params[:road_class])
    end
  end

  # GET /surveys/1
  # GET /surveys/1.json
  def show
  end

  # GET /surveys/new
  def new
    @survey = Survey.new
  end

  # GET /surveys/1/edit
  def edit
  end

  # POST /surveys
  # POST /surveys.json
  def create
    @survey = Survey.new(survey_params)

    respond_to do |format|
      if @survey.save 
        VehicleStat.import(@survey, params[:survey][:vehicle_stat]) if params[:survey][:vehicle_stat]
        format.html { redirect_to @survey, notice: 'Survey was successfully created.' }
        format.json { render :show, status: :created, location: @survey }
      else
        format.html { render :new }
        format.json { render json: @survey.errors, status: :unprocessable_entity }
      end
    end
  end

  def export
    @surveys = Survey.find(params[:survey_ids])
    respond_to do |format|
      format.xlsx {
        response.headers['Content-Disposition'] = 'attachment; filename="vehicle_stats.xlsx"'
      }
    end
  end

  # PATCH/PUT /surveys/1
  # PATCH/PUT /surveys/1.json
  def update
    respond_to do |format|
      if @survey.update(survey_params)
        VehicleStat.import(@survey, params[:survey][:vehicle_stat]) if params[:survey][:vehicle_stat]
        format.html { redirect_to @survey, notice: 'Survey was successfully updated.' }
        format.json { render :show, status: :ok, location: @survey }
      else
        format.html { render :edit }
        format.json { render json: @survey.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /surveys/1
  # DELETE /surveys/1.json
  def destroy
    @survey.destroy
    respond_to do |format|
      format.html { redirect_to surveys_url, notice: 'Survey was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_survey
      @survey = Survey.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def survey_params
      params.require(:survey).permit(:survey_ref, :date, :district, :road_name, :from, :to, :latitude, :longitude, :road_class, :road_type, :no_of_lanes, :lane_width, 
        :shoulder_type, :shoulder_width, :pavement_condition, :built_environment, :up_distance_to_junction, :up_junction_type, :up_signalized, :down_distance_to_junction, 
        :down_junction_type, :down_signalized)
    end
end
