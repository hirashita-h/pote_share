class CreateReservations < ActiveRecord::Migration[6.1]
  def change
    create_table :reservations do |t|
      t.references :user, null: false, foreign_key: true
      t.references :room, null: false, foreign_key: true
      t.integer :number_of_people
      t.datetime :check_in_day
      t.datetime :check_out_day

      t.timestamps
    end
  end
end
