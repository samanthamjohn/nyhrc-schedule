class Api::ScheduleController < ApplicationController

  def index
    schedule = Schedule.first
    render json: schedule.as_json
  end

  def show
    schedule = Schedule.first
    render json: { classes: schedule.approved_classes(params[:weekday])}
  end
end

