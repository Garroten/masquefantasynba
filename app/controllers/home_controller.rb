class HomeController < ApplicationController
  before_filter :get_leaders
  def index
    fantasy_service = FantasyService.new
    @assists_leaders = fantasy_service.assists_leaders     
    @blocks_leaders = fantasy_service.blocks_leaders
    @fouls_leaders = fantasy_service.fouls_leaders
    @rebounds_leaders = fantasy_service.rebounds_leaders
    @scores_leaders = fantasy_service.score_leaders
    @steals_leaders = fantasy_service.steals_leaders
    @technicals_leaders = fantasy_service.technicals_leaders
    @throws_leaders = fantasy_service.throws_leaders
    @turnovers_leaders = fantasy_service.turnovers_leaders
  end
  
  def get_leaders
    fantasy_service = FantasyService.new
    @playerss = fantasy_service.fantsy_leaders
  end
end
