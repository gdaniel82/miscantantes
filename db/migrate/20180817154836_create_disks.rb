class CreateDisks < ActiveRecord::Migration[5.2]
  def change
    create_table :disks do |t|
      t.references :singer
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
