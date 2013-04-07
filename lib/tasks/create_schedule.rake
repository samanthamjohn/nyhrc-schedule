require 'rake'
require 'net/http'
require 'nokogiri'
require 'open-uri'

task :get_daily_schedule => [:environment]  do
  Schedule.delete_all

  page = Nokogiri::HTML(open('http://nyhrc.com/find-class-instructor?field_class_location_id_value=All&field_class_category_value=All&field_class_instructor_value_selective=All&field_class_title_value_selective=All'))
  s = Schedule.new
  s.html = page.to_s
  s.save
end

