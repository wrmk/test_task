class CreateUserinfos < ActiveRecord::Migration[6.1]
  def change
    create_table :userinfos do |t|
      t.string :name
      t.string :gender
      t.date :gender_updated

      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
