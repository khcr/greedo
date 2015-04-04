class CreateChannels < ActiveRecord::Migration
  def change
    create_table :channels do |t|
      t.string :name
      t.string :description
      t.string :image
      t.boolean :private, default: false
      t.string :slug

      t.timestamps null: false
    end
  end
end
