require 'net/http'
require 'nokogiri'
require 'open-uri'
class ScheduleController < ApplicationController

  APPROVED_CLASSES = %w(
  sculpt
  iyoga
  stretch & abs
  pilates mat
  zumba
  pilates
  yoga
  abs
  bodysculpt
  core
  fluidity
  melt
  pilates mat
  boot
  assets
  dance
  barre
  )
  def index
    @page = Nokogiri::HTML(open('http://nyhrc.com/find-class-instructor?field_class_location_id_value=All&field_class_category_value=All&field_class_instructor_value_selective=All&field_class_title_value_selective=All'))
    @approved_classes = APPROVED_CLASSES
    @approved_locations = %w(23rd 13th 21st Astor)

  end
end
