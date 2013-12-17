class AddIndexesForSearch < ActiveRecord::Migration

  def up
    execute <<-SQL.strip
      DROP index IF EXISTS index_searches_on_term;
      CREATE index index_searches_on_term
        ON searches
        USING gin(to_tsvector('english', "searches"."term"::text));
    SQL
  end


  def down
    execute <<-SQL
      DROP INDEX index_searches_on_term;
    SQL
  end

end
