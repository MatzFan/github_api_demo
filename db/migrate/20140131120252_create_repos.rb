class CreateRepos < ActiveRecord::Migration
  def change
    create_table :repos, id: false do |t|
      t.integer :id, unique: true
      t.string :name
      t.string :full_name
      t.string :html_url

      t.timestamps
    end
    execute "ALTER TABLE repos ADD PRIMARY KEY (id);"
  end
end
