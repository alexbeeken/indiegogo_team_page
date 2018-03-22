class AddNameToCampaign < ActiveRecord::Migration[5.1]
  def change
    def change
      change_table :campaigns do |t|
        t.string :name
      end
    end
  end
end
