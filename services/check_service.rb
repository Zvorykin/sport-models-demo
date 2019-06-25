# frozen_string_literal: true

module CheckService
  class << self
    def perform(prompt)
      players = Player.all.map { |player| { name: player.name, value: player.id } }
      player_id = prompt.select('Please select player', players, enum: '.')

      metrics = Metric.all.map { |metric| { name: metric.name, value: metric.id } }
      metric_id = prompt.select('Please select metric', metrics, enum: '.')

      player_id = 1
      metric_id = 1

      player_metrics = Match.where(player_id: player_id)
                            .order_by(date: :asc)
                            .limit(5)

      p player_metrics
    end
  end
end