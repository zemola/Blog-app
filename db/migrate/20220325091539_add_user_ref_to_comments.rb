class AddUserRefToComments < ActiveRecord::Migration[7.0]
  def change
    add_reference :comments, :authorld, null: false, foreign_key: true
  end
end
