class ChangeHtmlToHash < ActiveRecord::Migration
  def change
    rename_column :schedules, :html, :schedule_data
  end
end
