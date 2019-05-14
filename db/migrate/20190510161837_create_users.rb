class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :username, limit: 50, format: {with: /^[a-zA-Z]+$/}, uniqueless: false, null: false
      t.timestamps
    end
  end
end
