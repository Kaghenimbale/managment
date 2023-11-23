class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :Student_name
      t.string :Book_title
      t.string :Book_id
      t.string :Student_class
      t.date :Date
      t.time :Time
      t.string :Librarian_name
      t.string :Librarian_phone_number

      t.timestamps
    end
  end
end
