class ProjectSnapshot < ActiveRecord::Migration[5.1]
  def change
    create_table :project_snapshots do |t|
      t.string  :raised
      t.string  :goal
      t.string  :percent_raised
      t.string  :percent_togo
      t.timestamps
    end
  end
end
