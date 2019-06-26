# frozen_string_literal: true

require 'sqlite3'
require 'active_record'

DB_PATH = 'development.sqlite3'

ActiveRecord::Base.establish_connection(
  adapter: 'sqlite3',
  database: DB_PATH,
  pool: 5,
  timeout: 5000
)

# Set up database tables and columns
ActiveRecord::Schema.define do
  create_table :metrics, force: true do |t|
    t.string :name

    t.timestamps
  end

  create_table :players, force: true do |t|
    t.string :name
    t.integer :team_id

    t.timestamps
  end

  create_table :teams, force: true do |t|
    t.string :name

    t.timestamps
  end

  create_table :matches, force: true do |t|
    t.string :place
    t.date :date

    t.timestamps
  end

  create_table :match_metrics, force: true do |t|
    t.belongs_to :match
    t.belongs_to :player
    t.belongs_to :metric
  end
  add_index(:match_metrics, %i[match_id player_id metric_id], unique: true)

  create_table :matches_teams, force: true do |t|
    t.belongs_to :match
    t.belongs_to :team
  end
  add_index(:matches_teams, %i[match_id team_id], unique: true)
end

require_relative './seeds'