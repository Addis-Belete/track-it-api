class MeasurmentsController < ApplicationController
  before_action :set_measurment, only: [:show, :update, :destroy]

  def index
    @measurments = Measurment.all
    json_response(@measurments)
  end

  def create
    @measurment = Measurment.create!(measurments_params)
    json_response(@measurment, :created)
  end

  def show
    json_response(@measurment)
  end

  def update
    @measurment.update(measurments_params)
    head :no_content
  end

  def destroy
    @measurment.destroy
    head :no_content
  end

  private

  def measurments_params
    params.permit(:category)
  end

  def set_measurment
    @measurment = Measurment.find(params[:id])
  end
end
