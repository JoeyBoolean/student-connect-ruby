class RenameAssginmentsToAssignment < ActiveRecord::Migration
  def change
  	rename_table :assignments, :assignment 
  end
end
