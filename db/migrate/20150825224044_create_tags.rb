class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.tid :name
      t.type :name
      t.value :name

      t.timestamps null: false
    end
  end
end
