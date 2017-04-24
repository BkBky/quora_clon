class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest #observar que ya no se llama ":password" como lo usamos en usuarios dummy
    end
  end
end
