class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.string :description

      t.timestamps
    end
  end
  
  def up
    remove_column :projects, :name
  end
  
  def down
    add_column :projects, :name, :string
  end
end
