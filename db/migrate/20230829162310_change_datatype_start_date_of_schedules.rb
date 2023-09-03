class ChangeDatatypeStartDateOfSchedules < ActiveRecord::Migration[7.0]
  def change
    change_column :schedules, :start_date, :datetime
  end
end
