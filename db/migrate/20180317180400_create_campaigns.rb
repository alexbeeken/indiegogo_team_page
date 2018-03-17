class CreateCampaigns < ActiveRecord::Migration[5.1]
  def change
    create_table :campaigns do |t|
      t.string :url
      t.float  :goal
      t.float  :raised
      t.string :title
    end
  end
end
