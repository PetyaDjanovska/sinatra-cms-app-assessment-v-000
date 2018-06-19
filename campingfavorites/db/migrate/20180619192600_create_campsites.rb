class CreateCampsites < ActiveRecord::Migration
  def change
    create_table :campsites do |t|
      t.string :name
      t.string :address
      t.integer :rating
    end
  end
end
