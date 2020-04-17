class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.references :user, null: false 
      t.references :movie, null: false
      t.text :body 
      t.datetime :posted_at, null: false 

      t.timestamps
    end
  end
end
