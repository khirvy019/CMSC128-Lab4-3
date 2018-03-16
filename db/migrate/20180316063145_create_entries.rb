class CreateEntries < ActiveRecord::Migration[5.1]
  def change
    create_table :entries do |t|
      t.string :sender
      t.string :message

      t.timestamps
    end
  end
end
