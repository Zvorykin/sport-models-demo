# frozen_string_literal: true

require_relative './application_record'
require_relative './match_metrics'

class Match < ApplicationRecord
  has_many :match_metrics, class_name: 'MatchMetrics'
  has_many :players, through: :match_metrics
  has_many :metrics, through: :match_metrics
  has_and_belongs_to_many :teams

  validates :place, presence: true
  validates :date, presence: true
end
