class CreateBacheloretteContestant < ActiveRecord::Migration[5.2]
  def change
    create_table :bachelorette_contestants do |t|
      t.references :bachelorette, foreign_key: true
      t.references :contestant, foreign_key: true

      t.timestamps 
    end
  end
end
