class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
	  t.string :name
      t.string :email
      t.string :repository_url
      t.integer :user_id
      t.datetime :last_built
      t.timestamps
    end
  end
end
