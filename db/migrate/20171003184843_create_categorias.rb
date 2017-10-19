class CreateCategorias < ActiveRecord::Migration[5.0]
  def change
    create_table :categorias do |t|
      t.string :nome
      t.string :cor
      t.integer :user_id

      t.timestamps
    end
    add_index :categorias, :user_id
  end
end
