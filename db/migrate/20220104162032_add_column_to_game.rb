class AddColumnToGame < ActiveRecord::Migration[6.1]
  def change
    add_column :games, :winner, :string, array: true, default: [:pending]
  end
end
