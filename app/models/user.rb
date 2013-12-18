class User < ActiveRecord::Base
  attr_accessible :name

  has_many :posts

  include PgSearch
  multisearchable against: :name


end
