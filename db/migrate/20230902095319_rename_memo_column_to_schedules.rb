class RenameMemoColumnToSchedules < ActiveRecord::Migration[7.0]
  def change
    rename_column :schedules, :memo, :text_area
  end
end
