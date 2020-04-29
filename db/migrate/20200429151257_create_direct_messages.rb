class CreateDirectMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :direct_messages do |t|
      t.string :name
      t.string :mail
      t.string :subject
      t.text :dm

      t.timestamps
    end
  end
end
