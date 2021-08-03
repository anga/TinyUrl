class CreateTinies < ActiveRecord::Migration[6.1]
  def change
    create_table :tinies do |t|
      t.text :long
      t.string :short

      t.timestamps
    end
  end
end
