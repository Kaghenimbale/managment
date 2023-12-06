class CreateLivres < ActiveRecord::Migration[7.0]
  def change
    create_table :livres do |t|
      t.string :name
      t.binary :image
      t.string :author

      t.timestamps
    end
  end
end
