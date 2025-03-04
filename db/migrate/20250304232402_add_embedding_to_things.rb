class AddEmbeddingToThings < ActiveRecord::Migration[7.1]
  def change
    add_column :things, :embedding, :vector, limit: 1536
  end
end
