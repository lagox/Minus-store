class CreateCatalogs < ActiveRecord::Migration
  def self.up
    create_table :catalogs do |t|
      t.string :title
      t.float :length
      t.integer :price
      t.boolean :sold
      t.timestamps
    end
  end

  def self.down
    drop_table :catalogs
  end
end
