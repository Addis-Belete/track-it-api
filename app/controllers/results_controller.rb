class ResultsController < ApplicationController
  before_action :set_measurment
  before_action :set_measurment_result, only: [:show, :update, :destroy]

  def index
    json_response(@measurment.results)
  end

  def show
    json_response(@result)
  end

  def create
    @measurment.results.create!(result_params)
    json_response(@measurment, :created)
  end

  def update
    @result.update(result_params)
    head :no_content
  end

  def destroy
    @result.destroy
    head :no_content
  end

  private

  def result_params
    params.permit(:result)
  end

  def set_measurment
    @measurment = Measurment.find(params[:measurment_id])
  end

  def set_measurment_result
    @result = @measurment.results.find_by!(id: params[:id]) if @measurment
  end
end
