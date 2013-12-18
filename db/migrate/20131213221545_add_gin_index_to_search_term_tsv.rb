class AddGinIndexToSearchTermTsv < ActiveRecord::Migration

  def up
    execute <<-SQL.strip
      DROP index IF EXISTS index_searches_on_term_tsv;
      CREATE index index_searches_on_term_tsv
        ON searches USING gin(term_tsv);
    SQL
  end


  def down
    execute <<-SQL
      DROP INDEX index_searches_on_term_tsv;
    SQL
  end

end
