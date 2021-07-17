class CreateUserinfos < ActiveRecord::Migration[6.1]
  def change
    create_table :userinfos do |t|
      t.string :name
      t.string :sex
      t.date :sex_updated

      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
