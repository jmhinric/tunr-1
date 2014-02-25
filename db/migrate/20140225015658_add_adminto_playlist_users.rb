class AddAdmintoPlaylistUsers < ActiveRecord::Migration
  def change
    add_column :playlist_users, :creator_id, :integer
  end
end
