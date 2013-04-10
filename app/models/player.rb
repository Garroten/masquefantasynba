class Player < ActiveRecord::Base
  has_many :blocks
  has_many :assists
  has_many :fouls
  has_many :rebounds
  has_many :steals
  has_many :tuurnovers
  has_many :scores  
  attr_accessible :id, :player, :team
  attr_accessor :fantasy
  attr_reader :fantasy
end
