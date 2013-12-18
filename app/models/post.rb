class Post < ActiveRecord::Base
  attr_accessible :body, :title, :user_id

  belongs_to :user

  after_create :add_to_search

  def add_to_search
    query = <<-SQL
      INSERT INTO searches (searchable_type, searchable_id, term_tsv)
        VALUES ('Post', ?, to_tsvector(?));

      INSERT INTO searches (searchable_type, searchable_id, term_tsv)
        VALUES ('Post', ?, to_tsvector(?));
    SQL

    self.class.execute([query, self.id, self.title, self.id, self.body])
  end

end
