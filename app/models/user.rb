class User < ActiveRecord::Base
  attr_accessible :name

  has_many :posts


  after_create :add_to_search

  def add_to_search
    Search.create(term: self.name, searchable_type: "User", searchable_id: self.id)
  end

end
