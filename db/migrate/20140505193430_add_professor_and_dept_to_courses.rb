class AddProfessorAndDeptToCourses < ActiveRecord::Migration
  def change
  	add_column :courses, :professor, :string
  	add_column :courses, :dept, :string
  end
end
