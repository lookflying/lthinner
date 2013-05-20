class CreateWeightRecords < ActiveRecord::Migration
  def change
    create_table :weight_records do |t|
      t.datetime :time
      t.decimal :weight
      t.string :info

      t.timestamps
    end
  end
end
