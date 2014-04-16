class CreateUsers < ActiveRecord::Migration
  def change
    # create_table :users do |t|
    #   t.string :name
    #   t.string :email
    #   t.string :password_digest
    #   t.attachment :avatar
    #   t.string :bio
    #   t.timestamps
    # end

    create_table :bed_types do |t|
      t.string :name
    end

    create_table :room_types do |t|
      t.string :name
    end

    create_table :amenities do |t|
      t.string :name
    end

    create_table :tags do |t|
      t.belongs_to :listing
      t.belongs_to :amenity
    end

    create_table :reservations do |t|
      t.belongs_to :listing
      t.belongs_to :user
    end

    create_table :listings do |t|
      t.belongs_to :user
      t.string :address
      t.string :city
      t.belongs_to :bed_type
      t.belongs_to :room_type
      t.integer :bedroom_count
      t.integer :bathroom_count
      t.text :description
      t.float :nightly_rate
      t.float :weekly_rate
      t.float :monthly_rate
    end

    create_table :photos do |t|
      t.attachment :picture
      t.belongs_to :listing
    end

  end
end
