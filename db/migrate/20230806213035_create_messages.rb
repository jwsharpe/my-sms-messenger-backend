class CreateMessages < ActiveRecord::Migration[7.0]
  def change
    create_table :messages do |t|
      t.references :user, null: false, foreign_key: true
      t.string :phone_number
      t.string :body

      t.timestamps
    end
  end
end
