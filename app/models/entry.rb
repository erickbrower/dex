class Entry < ActiveRecord::Base
  attr_accessible :content, :title, :etype

  validates :content, presence: true
  validates :title, presence: true
  validates :etype, presence: true
end
