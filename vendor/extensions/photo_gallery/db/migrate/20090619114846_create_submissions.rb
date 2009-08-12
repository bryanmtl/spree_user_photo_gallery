class CreateSubmissions < ActiveRecord::Migration
  def self.up
    create_table :submissions do |t|
      t.integer :product_id, :user_id, :image_file_size
      t.boolean :active, :default => true
      t.string  :image_file_name, :image_content_type
      t.datetime :image_updated_at
      t.timestamps
    end
  end

  def self.down
    drop_table :submissions
  end
end
