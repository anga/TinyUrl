class CreateTapes < ActiveRecord::Migration[6.1]
  def change
    create_table :tapes do |t|
      t.string :ip
      t.string :user_agent
      t.belongs_to :tiny

      t.timestamps
    end
  end
end
