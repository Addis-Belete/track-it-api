class MeasurmentsController < ApplicationController
  def index
    @measurments = Measurment.all
    json_response(@measurments)
  end

  def create
    @todo = Todo.create!(todos_params)
    json_response(@todo, :created)
  end

  def show
    json_response(@todo)
  end

  private

  def todos_params
    params.permit(:category)
  end
end
