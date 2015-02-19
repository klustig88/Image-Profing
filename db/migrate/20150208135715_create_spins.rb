class CreateSpins < ActiveRecord::Migration
  def change

  	create_table :spins do |t|
      t.string :name
      t.string :column
      t.string :row
   
  	end
  end
end
