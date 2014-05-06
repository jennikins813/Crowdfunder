class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title
      t.text :blurb
      t.integer :funding_goal
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
