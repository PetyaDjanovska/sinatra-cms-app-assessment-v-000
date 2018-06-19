class CreateUserCampsites < ActiveRecord::Migration
  def change
    create_table :user_campsites do |t|
      t.integer :user_id
      t.integer :campsite_id
    end
  end
end
