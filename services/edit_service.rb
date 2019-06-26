# frozen_string_literal: true

module EditService
  class << self
    def perform(params = {})
      metric_id = params[:metric_id]
      player_id = params[:player_id]
      match_id = params[:match_id]

      MatchMetrics.find_or_create_by(
        metric_id: metric_id,
        player_id: player_id,
        match_id: match_id
      )
    end
  end
end