# frozen_string_literal: true

module TopService
  class << self
    def perform(params = {})
      metric_id = params[:metric_id]
      team_id = params[:team_id]
      # metric_id = 1

      metrics_sum = MatchMetrics
                      .joins(:player)
                      .select('player_id, count(*) as sum')
                      .where(metric_id: metric_id)
                      .group(:player_id)
                      .order(sum: :desc)
                      .limit(5)

      metrics_sum = metrics_sum.where(players: { team_id: team_id }) if team_id.present?

      p metrics_sum.to_sql
      metrics_sum
    end
  end
end