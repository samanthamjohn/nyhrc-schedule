class Api::ScheduleController < ApplicationController

  def index
    schedule = Schedule.first
    render json: schedule.as_json
  end
end

