class AddImageUrl < ActiveRecord::Migration[5.1]
  def change
    change_table :campaigns do |t|
      t.string :image_url
    end
  end
end
