class CreateGames < ActiveRecord::Migration[6.1]
  def change
    create_table :games do |t|
      t.references :user, null: false, foreign_key: true
      t.references :computer_persona, null: false, foreign_key: true
      t.references :user_persona, null: false, foreign_key: true
      t.references :persona, null: false, foreign_key: true

      t.timestamps
    end
  end
end
