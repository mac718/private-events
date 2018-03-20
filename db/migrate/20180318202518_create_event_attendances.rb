class CreateEventAttendances < ActiveRecord::Migration[5.0]
  def change
    create_table :event_attendances do |t|
      t.integer :attendance_id
      t.integer :attendee_id

      t.timestamps
    end
  end
end
