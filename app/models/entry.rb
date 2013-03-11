class Entry < ActiveRecord::Base
  include PgSearch

  attr_accessible :content, :title, :etype

  validates :content, presence: true
  validates :title, presence: true
  validates :etype, presence: true

  pg_search_scope :search_by_all, :against => [:content, :title, :etype]
end
