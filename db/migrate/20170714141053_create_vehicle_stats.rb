class CreateVehicleStats < ActiveRecord::Migration[5.0]
  def change
    create_table :vehicle_stats do |t|
      t.references :survey, index: true
      t.string  :type, index: true
      t.time    :from, index: true
      t.time    :to, index: true
      t.integer :motor_cycle
      t.integer :three_wheeler
      t.integer :car
      t.integer :van_jeep
      t.integer :light_goods_vehicle
      t.integer :medium_goods_vehicle
      t.integer :heavy_goods_vehicle
      t.string  :multi_axle_goods_vehicle
      t.string  :mini_bus
      t.string  :large_bus
      t.string  :service_vehicle
      t.string  :tractor
      t.string  :bicycle
      t.integer :cart
      t.integer :total, index: true

      t.timestamps
    end
    add_index :vehicle_stats, [:survey_id, :type]
    add_index :vehicle_stats, [:from, :to]
  end
end
