class CreateHaikus < ActiveRecord::Migration
  def change
    create_table :haikus do |t|
      t.string :name
      t.string :mood_id
      t.string :user_id
    end
  end
end
