class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.text :body, null: false
      t.belongs_to :proposal
      t.belongs_to :user

      t.timestamps null: false
    end
  end
end
