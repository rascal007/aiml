class CreatePatients < ActiveRecord::Migration
  def change
    create_table :patients do |t|
      t.string :name
      t.string :phonenumber
      t.string :address
      t.integer :age
      t.integer :height
      t.integer :weight
      t.string :aadharnumber

      t.timestamps null: false
    end
  end
end
