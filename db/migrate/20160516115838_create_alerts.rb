class CreateAlerts < ActiveRecord::Migration
  def change
    create_table :alerts do |t|
      t.string :title
      t.string :date

      t.timestamps null: false
    end
  end
end
