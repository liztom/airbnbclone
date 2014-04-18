class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.text :description
      t.belongs_to :user
      t.integer :rating
      t.references :commentable, polymorphic: true

      t.timestamps
    end
  end
end
