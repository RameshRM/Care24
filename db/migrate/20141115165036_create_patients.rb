class CreatePatients < ActiveRecord::Migration
  def change
    create_table :patients do |t|
      t.string :email
      t.string :last_name
      t.string :first_name

      t.timestamps
    end
  end
end
