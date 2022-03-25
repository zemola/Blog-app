class AddUserRefToPost < ActiveRecord::Migration[7.0]
  def change
    add_reference :posts, :authorld, null: false, foreign_key: true
  end
end
