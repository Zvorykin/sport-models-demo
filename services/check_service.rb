# frozen_string_literal: true

module CheckService
  class << self
    def perform(params = {})
      player_id = params[:player_id]
      metric_id = params[:metric_id]
      # player_id = 4
      # metric_id = 1

      player_matches = Match.includes(:teams)
                            .references(:teams)
                            .where(teams: { id: Player.find(player_id).team.id })
                            .order(date: :desc)
                            .limit(5)

      Match.includes(:match_metrics)
           .where(match_metrics: {
              player_id: player_id,
              metric_id: metric_id,
              match_id: player_matches.pluck(:id)
            })
           .order(date: :desc)
    end
  end
end