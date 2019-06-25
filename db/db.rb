# frozen_string_literal: true

require 'sqlite3'
require 'active_record'

DB_PATH = 'development.sqlite3'
File.delete(DB_PATH) if File.exist?(DB_PATH)

ActiveRecord::Base.establish_connection(
  adapter: 'sqlite3',
  database: DB_PATH,
  pool: 5,
  timeout: 5000
)

# Set up database tables and columns
ActiveRecord::Schema.define do
  create_table :metrics do |t|
    t.string :name

    t.timestamps
  end

  create_table :players do |t|
    t.string :name
    t.integer :team_id

    t.timestamps
  end

  create_table :teams do |t|
    t.string :name

    t.timestamps
  end

  create_table :matches do |t|
    t.string :place
    t.date :date

    t.timestamps
  end

  create_table :match_metrics do |t|
    t.integer :match_id
    t.integer :player_id
    t.integer :metric_id
  end
  add_index(:match_metrics, %i[match_id player_id metric_id], unique: true)

  create_join_table :matches, :teams, primary: false
  add_index(:matches_teams, %i[match_id team_id], unique: true)
end

require_relative './seeds'