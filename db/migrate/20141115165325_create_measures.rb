class CreateMeasures < ActiveRecord::Migration
  def change
    create_table :measures do |t|
      t.integer :patient_id
      t.string :type
      t.string :name
      t.string :data

      t.timestamps
    end
  end
end
