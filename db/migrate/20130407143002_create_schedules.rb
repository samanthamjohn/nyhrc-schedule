class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.text :html
      t.timestamps
    end
  end
end
