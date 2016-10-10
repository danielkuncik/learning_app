class CreateQuizes < ActiveRecord::Migration[5.0]
  def change
    create_table :quizes do |t|
      t.string :name
      t.integer :max, default: 20
      t.text :description

      t.timestamps
    end
  end
end
