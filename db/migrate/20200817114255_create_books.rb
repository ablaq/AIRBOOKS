class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.string :language
      t.string :subject
      t.text :summary
      t.integer :pages
      t.integer :year
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
