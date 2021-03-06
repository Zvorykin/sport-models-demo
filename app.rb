# frozen_string_literal: true

require 'tty-prompt'

require_relative './db/db'
Dir[File.join(__dir__, 'services', '*.rb')].each { |file| require file }

PLAYERS_LIST = Player.all.map { |player| { name: player.name, value: player.id } }
METRICS_LIST = Metric.all.map { |metric| { name: metric.name, value: metric.id } }
TEAMS_LIST = Team.all.map { |team| { name: team.name, value: team.id } }

MAIN_CHOICES = [
  { name: 'Edit player metrics', value: :edit },
  { name: 'Check out player metrics for last 5 matches', value: :check },
  { name: 'TOP-5 players', value: :top }
].freeze

def edit_handle(prompt)
  params = prompt.collect do
    key(:player_id).select('Please select player', PLAYERS_LIST, enum: '.')
    key(:metric_id).select('Please select metric', METRICS_LIST, enum: '.')
  end

  matches = Player.find(params[:player_id]).matches
              .map { |match| { name: "#{match.place} - #{match.date}", value: match.id } }
  params[:match_id] = prompt.select('Please select match', matches, enum: '.')

  EditService.perform(params)
  p 'Done!'
end

def check_handle(prompt)
  params = prompt.collect do
    key(:player_id).select('Please select player', PLAYERS_LIST, enum: '.')
    key(:metric_id).select('Please select metric', METRICS_LIST, enum: '.')
  end

  results = CheckService.perform(params)

  if results.any?
    p 'Found some metrics!'
    results.each { |r| p "#{r.date} - #{r.place}" }
  else
    p 'No such metrics were found for that player :-('
  end
end

def top_handle(prompt)
  team_choices = [{ name: 'Overall', value: nil }] + TEAMS_LIST

  params = prompt.collect do
    key(:metric_id).select('Please select metric', METRICS_LIST, enum: '.')
    key(:team_id).select('Please select team or choose "overall"', team_choices, enum: '.')
  end

  results = TopService.perform(params)

  if results.any?
    p 'TOP-5!'
    results.each_with_index do |r, index|
      p "#{index + 1}. #{r.player.name}(id=#{r.player.id}) - #{r.sum}"
    end
  else
    p 'No metrics found :-('
  end
end

prompt = TTY::Prompt.new
loop do
  # main_choice = :top
  main_choice = prompt.select('Please select an option', MAIN_CHOICES)

  # Service Object is not ideal pattern to use here but it's ok for demo purpose
  case main_choice
  when :edit
    edit_handle(prompt)
  when :check
    check_handle(prompt)
  when :top
    top_handle(prompt)
  else
    p 'smth wrong'
  end

  # break
end

p 'Thanks!'