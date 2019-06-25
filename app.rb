# frozen_string_literal: true

require 'tty-prompt'

require_relative './db/db'
Dir[File.join(__dir__, 'services', '*.rb')].each { |file| require file }

MAIN_CHOICES = [
  { name: 'Edit player metrics', value: :edit },
  { name: 'Check out player metrics for last 5 matches', value: :check },
  { name: 'TOP-5 players', value: :top }
].freeze

prompt = TTY::Prompt.new
loop do
  main_choice = prompt.select('Please select an option', MAIN_CHOICES)

  case main_choice
  when :edit
    p 'working'
  when :check
    CheckService.perform(prompt)
  when :top
    p 'working'
  else
    p 'smth wrong'
  end
end

p 'Thanks!'