class ChangeDatatypeEndDateOfSchedules < ActiveRecord::Migration[7.0]
  def change
    change_column :schedules, :end_date, :datetime
  end
end
