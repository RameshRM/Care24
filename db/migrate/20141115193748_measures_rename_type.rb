class MeasuresRenameType < ActiveRecord::Migration
  def change
    rename_column :measures, :type, :measure_type 
  end
end
