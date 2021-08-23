class MeasurmentsController < ApplicationController
  validates :category, presence: true

  def index
    @measurments = Measurment.all
    json_response(@measurments)
  end

  def create
    @measurment = Measurment.create!(measurments_params)
    json_response(@measurment, :created)
  end

  def show
    @measurment = Measurment.find(params[:id])
    json_response(@measurment)
  end

  def update
    @measurment = Measurment.find(params[:id])
    @measurment.update(measurments_params)
    head :no_content
  end

  def destroy
    @measurment = Measurment.find(params[:id])
    @measurment.destroy
    head :no_content
  end

  private

  def measurments_params
    params.permit(:category)
  end
end
