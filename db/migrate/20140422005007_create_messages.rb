class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :course_id
      t.integer :user_id
      t.string :message

      t.timestamps
    end
  end
end
