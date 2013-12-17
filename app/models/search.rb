class Search < ActiveRecord::Base
  attr_accessible :term, :searchable_type, :searchable_id
  extend Textacular

  attr_accessible :query
  attr_accessor :query

  belongs_to :searchable, polymorphic: true

  def results
    self.class.search(self.query).preload(:searchable).map!(&:searchable).uniq
  end
end
