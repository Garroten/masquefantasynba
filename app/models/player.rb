class Player < ActiveRecord::Base
  has_many :blocks
  has_many :assists
  attr_accessible :id, :player, :team
end
