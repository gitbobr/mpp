class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :delivery_address
      t.string :phone

      t.timestamps
    end
  end
end
