class CreateOutings < ActiveRecord::Migration[5.2]
  def change
    create_table :outings do |t|
      t.references :bachelorette, foreign_key: true
      t.references :contestant, foreign_key: true
      t.string :name
      t.string :location
      t.datetime :date
    end
  end
end
