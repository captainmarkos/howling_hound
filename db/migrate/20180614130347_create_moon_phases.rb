class CreateMoonPhases < ActiveRecord::Migration[5.2]
  def change
    create_table :moon_phases do |t|

      t.string :phase, null: false
      t.date :date, null: false
      t.time :time, null: false
      t.string :date_raw, null: false
      t.string :time_raw, null: false
      t.timestamps
    end

    add_index :moon_phases, [:date, :time], unique: true
  end
end
