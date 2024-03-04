class CreateDoctors < ActiveRecord::Migration[7.1]
  def change
    create_table :doctors do |t|
      t.string :name
      t.string :doctor_type
      t.string :image_url
      t.string :address

      t.timestamps
    end
  end
end
