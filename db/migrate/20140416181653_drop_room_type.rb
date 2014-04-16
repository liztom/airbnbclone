class DropRoomType < ActiveRecord::Migration
  def change
    remove_column :listings, :room_type_id, :integer
    remove_column :listings, :bed_type_id, :integer
    add_column :listings, :room_type, :string
    add_column :listings, :bed_type, :string
    drop_table :room_types
    drop_table :bed_types
  end
end
