class CreateTokens < ActiveRecord::Migration
  def change
    create_table :tokens do |t|
      t.string :value
      t.boolean :is_active
      t.integer :user_id

      t.timestamps
    end
  end
end
