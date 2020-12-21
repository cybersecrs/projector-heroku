class CreateProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :projects do |t|
      t.string  :naziv,   null: false, default: ""
      t.text    :opis
      t.decimal :ukupno,  null: false, default: 0
      t.decimal :do_sada, null: false, default: 0
      t.boolean :aktivan, null: false, default: true
      t.integer :user_id, foreign_key: true

      t.timestamps
    end

    add_index :projects, :naziv, unique: true
  end
end
