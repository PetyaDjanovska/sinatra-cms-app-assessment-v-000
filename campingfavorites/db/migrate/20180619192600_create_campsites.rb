class CreateCampsites < ActiveRecord::Migration
  def change
    create_table :campsites do |t|
      t.string :name
      t.string :address
      t.integer :rating
      t.integer :created_by
    end
  end
end
