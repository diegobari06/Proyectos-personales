class CreateOmments < ActiveRecord::Migration
  def change
    create_table :omments do |t|
      t.references :user, index: true, foreign_key: true
      t.references :article, index: true, foreign_key: true
      t.text :body

      t.timestamps null: false
    end
  end
end
