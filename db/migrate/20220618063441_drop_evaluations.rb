class DropEvaluations < ActiveRecord::Migration[6.1]
  def change
    drop_table :evaluations do |t|
      t.integer :user_id
      t.integer :post_id
      t.float :star

      t.timestamps
    end
  end
end
