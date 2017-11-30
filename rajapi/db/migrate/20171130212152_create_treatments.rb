class CreateTreatments < ActiveRecord::Migration
  def change
    create_table :treatments do |t|
      t.references :patient, index: true, foreign_key: true
      t.string :description
      t.boolean :isdiagnosed

      t.timestamps null: false
    end
  end
end
