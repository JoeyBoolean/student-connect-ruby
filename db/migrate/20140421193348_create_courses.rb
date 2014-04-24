class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :crn
      t.string :name
      t.string :meeting_time

      t.timestamps
    end
    add_index :courses, :crn
  end
end
