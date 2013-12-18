class ActiveRecord::Base
  def self.execute(sql_array)
    ActiveRecord::Base.connection.execute(sanitize_sql_array(sql_array))
  end
end

class User < ActiveRecord::Base
  attr_accessible :name

  has_many :posts


  after_create :add_to_search

  def add_to_search
    query = <<-SQL
      INSERT INTO searches (searchable_type, searchable_id, term_tsv)
        VALUES ('User', ?, to_tsvector( ? )\);
      SQL

    self.class.execute([query, self.id.to_s, self.name])
  end

end
