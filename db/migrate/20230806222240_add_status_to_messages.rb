class AddStatusToMessages < ActiveRecord::Migration[6.1]
  def change
    add_column :messages, :status, :string, default: "UNSENT"
  end
end
