class ChangeDatesInPerformances < ActiveRecord::Migration[7.1]
  def change
    change_column :performances, :start_date, :datetime
    change_column :performances, :end_date, :datetime
  end
end
