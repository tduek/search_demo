class AddTsColumn < ActiveRecord::Migration

  def up
    execute <<-SQL
      ALTER TABLE searches ADD COLUMN TermForSearch tsvector;

      UPDATE searches SET TermForSearch = to_tsvector('english', "searches"."term");
    SQL
  end


  def down
    execute <<-SQL
    ALTER TABLE searches DROP COLUMN TermForSearch;
    SQL
  end
end
