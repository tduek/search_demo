class CreateSearches < ActiveRecord::Migration

  def up
    create_table :searches do |t|
      t.string :searchable_type
      t.integer :searchable_id
    end

    execute <<-SQL
      ALTER TABLE searches
        ADD COLUMN term_tsv tsvector;
    SQL
  end

  def down
    drop_table :searches
  end

end
