class AddPercentFields < ActiveRecord::Migration[5.1]
  def change
    change_table :campaigns do |t|
      t.string :percent_raised
      t.string :percent_togo
    end
  end
end
