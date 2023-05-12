class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.references :municipe, null: false, foreign_key: true
      t.string :zip_code
      t.string :street
      t.string :number
      t.string :complement
      t.string :neighborhood
      t.string :city
      t.string :state
      t.string :code_ibge

      t.timestamps
    end
  end
end
