class CreateMovieImages < ActiveRecord::Migration[5.2]
  def change
    create_table :movie_images do |t|
      t.references :movie 
      t.string :alt_text

      t.timestamps
    end
  end
end
