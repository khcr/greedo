class AddTokenToChannels < ActiveRecord::Migration
  def change
    add_column :channels, :token, :string
  end
end
