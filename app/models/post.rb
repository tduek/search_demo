class Post < ActiveRecord::Base
  attr_accessible :body, :title, :user_id

  belongs_to :user

  include PgSearch
  multisearchable against: [:title, :body]
end
