class CreateHosts < ActiveRecord::Migration[5.2]
  def change
    create_table :hosts do |t|
      t.belongs_to :show, foreign_key: true
      t.string :name
      t.text :bio
      t.string :photo_url

      t.timestamps
    end
  end
end
