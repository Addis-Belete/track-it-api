class MeasurmentsController < ApplicationController
  def index
    @measurments = Measurment.all
    json_response(@measurments)
  end

  def create
    @measurment = Measurment.create!(measurments_params)
    json_response(@measurment, :created)
  end

  def show
    @measurment = Measurment.find(params[id])
    json_response(@measurment)
  end

  private

  def measurments_params
    params.permit(:category)
  end
end
