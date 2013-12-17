class AddTsColumnGindex < ActiveRecord::Migration

  def up
    execute <<-SQL
      CREATE INDEX TermForSearch_GIN ON searches USING GIN(TermForSearch);
    SQL
  end

  def down
    execute <<-SQL
      DROP INDEX TermForSearch_GIN;
    SQL
  end

end