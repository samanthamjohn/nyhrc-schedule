class ScheduleController < ApplicationController

  def index
    @schedule = Schedule.first
  end
end
