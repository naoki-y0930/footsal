class AddReadFlgToMessages < ActiveRecord::Migration[5.2]
  def change
    add_column :messages, :read_flg, :integer
  end
end
