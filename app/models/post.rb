class Post < ActiveRecord::Base
  attr_accessible :body, :title, :user_id

  belongs_to :user

  after_create :add_to_search

  def add_to_search
    Search.create(term: self.title, searchable_type: "Post", searchable_id: self.id)
    Search.create(term: self.body, searchable_type: "Post", searchable_id: self.id)
  end

end
