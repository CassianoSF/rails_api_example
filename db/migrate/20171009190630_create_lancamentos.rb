class CreateLancamentos < ActiveRecord::Migration[5.0]
  def change
    create_table :lancamentos do |t|
      t.float :valor
      t.string :descricao
      t.integer :user_id
      t.integer :categoria_id
      t.string  :tipo

      t.timestamps
    end
    add_index :lancamentos, :user_id
  end
end
