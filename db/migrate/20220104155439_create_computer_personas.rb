class CreateComputerPersonas < ActiveRecord::Migration[6.1]
  def change
    create_table :computer_personas do |t|
      t.string :name
      t.text :url
      t.string :gender
      t.string :hat_color
      t.string :hair_color
      t.string :hair_length
      t.string :eyes
      t.string :nose
      t.string :mustache
      t.string :beard
      t.string :face_shape
      t.string :glasses
      t.string :earrings
      t.string :face_color

      t.timestamps
    end
  end
end
