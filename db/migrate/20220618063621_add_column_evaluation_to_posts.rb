class AddColumnEvaluationToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :evaluation, :float
  end
end
