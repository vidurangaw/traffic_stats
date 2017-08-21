class SurveysController < ApplicationController
  before_action :set_survey, only: [:show, :edit, :update, :destroy]

  # GET /surveys
  # GET /surveys.json
  def index
    @surveys = Survey.all
  end

  def search
    @surveys = Survey.all
    if params[:q].present?
      @surveys = @surveys.search(params[:q])
    end
    if params[:date_from].present?
      @surveys = @surveys.where("date >= ?", params[:from])
    end
    if params[:date_to].present?
      @surveys = @surveys.where("date <= ?", params[:to])
    end    
    if params[:district].present?
      @surveys = @surveys.where(district: params[:district])
    end
    if params[:road_class].present?
      @surveys = @surveys.where(road_class: params[:road_class])
    end
    if params[:road_type].present?
      @surveys = @surveys.where(road_type: params[:road_type])
    end
    if params[:no_of_lanes].present?
      @surveys = @surveys.where(no_of_lanes: params[:no_of_lanes])
    end
    if params[:lane_width_from].present?
      @surveys = @surveys.where("lane_width >= ?", params[:lane_width_from])
    end
    if params[:lane_width_to].present?
      @surveys = @surveys.where("lane_width <= ?", params[:lane_width_to])
    end 
    if params[:shoulder_type].present?
      @surveys = @surveys.where(shoulder_type: params[:shoulder_type])
    end
    if params[:shoulder_width_from].present?
      @surveys = @surveys.where("shoulder_width >= ?", params[:shoulder_width_from])
    end
    if params[:shoulder_width_to].present?
        @surveys = @surveys.where("shoulder_width <= ?", params[:shoulder_width_to])
    end 
    if params[:pavement_condition].present?
      @surveys = @surveys.where(pavement_condition: params[:pavement_condition])
    end
    if params[:built_environment].present?
      @surveys = @surveys.where(built_environment: params[:built_environment])
    end
    if params[:row_from].present?
      @surveys = @surveys.where("row >= ?", params[:row_from])
    end
    if params[:row_to].present?
      @surveys = @surveys.where("row <= ?", params[:row_to])
    end
    if params[:speed_limit].present?
      @surveys = @surveys.where(speed_limit: params[:speed_limit])
    end
    if params[:ffs_from].present?
      @surveys = @surveys.where("ffs >= ?", params[:ffs_from])
    end
    if params[:ffs_to].present?
      @surveys = @surveys.where("ffs <= ?", params[:ffs_to])
    end
    if params[:traffic_composition].present?
      @surveys = @surveys.where(traffic_composition: params[:traffic_composition])
    end
    if params[:access_point_density].present?
      @surveys = @surveys.where(access_point_density: params[:access_point_density])
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
        :shoulder_type, :shoulder_width, :pavement_condition, :built_environment, :row, :speed_limit, :ffs, :traffic_composition, :access_point_density, :up_grade, 
        :up_distance_to_junction, :up_junction_type, :up_signalized, :down_grade, :down_distance_to_junction, :down_junction_type, :down_signalized)
    end
end
