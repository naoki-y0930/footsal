class AddConditionToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :conditions, :string
  end
end
