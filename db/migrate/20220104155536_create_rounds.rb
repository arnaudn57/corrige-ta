class CreateRounds < ActiveRecord::Migration[6.1]
  def change
    create_table :rounds do |t|
      t.references :game, null: false, foreign_key: true
      t.string :user_feature
      t.string :user_adjective
      t.string :user_validation
      t.string :computer_feature
      t.string :computer_adjective
      t.string :computer_validation
      t.integer :position

      t.timestamps
    end
  end
end
