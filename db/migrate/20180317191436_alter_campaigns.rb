class AlterCampaigns < ActiveRecord::Migration[5.1]
  def change
    change_table :campaigns do |t|
      t.integer :igg_id
    end
    rename_column :campaigns, :url, :slug
  end
end
