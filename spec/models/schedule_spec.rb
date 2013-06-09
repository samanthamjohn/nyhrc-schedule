require 'spec_helper'

describe Schedule do
  before :all do
    @schedule = Schedule.new
    f = File.open(Rails.root.join("spec/page.html"), "r")
    @schedule.html = f.read
  end


  describe "html=" do
    it "should set the schedule_hash" do
      f = File.open(Rails.root.join("spec/page.html"), "r")
      s = Schedule.new
      s.html = f.read
      expect(s.schedule_data.keys).to eq(Schedule::DAYS)
    end
  end

  describe "tables" do
    it "should return 7 tables" do
      @schedule.tables.count.should == 7
    end

    it "each table should have a caption for a day of the week" do
      @schedule.tables.each do |t|
        Schedule::DAYS.should include(t.css('caption').text)
      end
    end
  end

  describe "table_for(weekday)" do
    it "should return the table for that day" do
      monday = @schedule.table_for("Monday")
      monday.css("caption").text.should == "Monday"
    end
  end

  describe "approved_classes(weekday)" do
    it "should return only classes on the list" do
      tuesday_classes = @schedule.approved_classes("Tuesday")

      num_classes_approved = 0
      tuesday_classes.each do |tuesday_class|
        Schedule::APPROVED_CLASSES.each do |approved_class|
          if tuesday_class.title.downcase.match(approved_class)
            num_classes_approved += 1
            break
          end
        end
      end

      num_classes_approved.should == tuesday_classes.count
    end

    it "should return only locations on the list" do
      monday_classes = @schedule.approved_classes("Monday")

      num_classes_approved = 0
      Schedule::APPROVED_LOCATIONS.each do |approved_location|
        monday_classes.each do |monday_class|
          if monday_class.location.downcase.match(approved_location)
            num_classes_approved += 1
            next
          end
        end
      end

      num_classes_approved.should == monday_classes.count
    end

    it "should return classes in the correct format" do
      monday = @schedule.approved_classes("Monday").first
      monday.title.should be
      monday.location.should be
      monday.start_time.should be
      monday.end_time.should be
      monday.instructor.should be
    end
  end

  describe "as_json" do
    it "should render the approved classes for each day" do
      json = @schedule.as_json
      json[:schedule].count.should == 7
      json[:schedule][1]["day"].should == "Monday"
      json[:schedule][1]["classes"].count.should == @schedule.approved_classes("Monday").count
    end
  end
end
