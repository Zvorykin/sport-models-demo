# frozen_string_literal: true

require 'tty-prompt'

require_relative './db/db'
Dir[File.join(__dir__, 'services', '*.rb')].each { |file| require file }

PLAYERS_LIST = Player.all.map { |player| { name: player.name, value: player.id } }
METRICS_LIST = Metric.all.map { |metric| { name: metric.name, value: metric.id } }

MAIN_CHOICES = [
  { name: 'Edit player metrics', value: :edit },
  { name: 'Check out player metrics for last 5 matches', value: :check },
  { name: 'TOP-5 players', value: :top }
].freeze

prompt = TTY::Prompt.new
loop do
  # main_choice = prompt.select('Please select an option', MAIN_CHOICES)
  main_choice = :check

  # Service Object is not ideal pattern to use here but it's ok for demo purpose
  case main_choice
  when :edit
    p 'working'
  when :check
    params = prompt.collect do
      key(:player_id).select('Please select player', PLAYERS_LIST, enum: '.')
      key(:metric_id).select('Please select metric', METRICS_LIST, enum: '.')
    end

    results = CheckService.perform(params)

    if results.any?
      p 'Found some metrics!'
      results.each { |r| p "#{r.date} - #{r.place}" }
    else
      p 'No such metrics was found :-('
    end
  when :top
    p 'working'
  else
    p 'smth wrong'
  end

  break
end

p 'Thanks!'