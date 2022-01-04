# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'csv'

csv_options = { col_sep: ';', quote_char: '"', headers: :first_row }
filepath    = "#{Rails.root.join('lib/guess_who_data.csv')}"

CSV.foreach(filepath, csv_options) do |row|
  Persona.create!(url: row['url'], name: row['name'], gender: row['gender'], hat_color: row['hat_color'], hair_color: ['hair_color'], hair_length: row['hair_length'], eyes: row['eyes'], nose: row['nose'], mustache: row['mustache'], beard: row['beard'], face_shape: row['face-shape'], glasses: row['glasses'], earrings: row['earings'], face_color: row['face_color'])
end
