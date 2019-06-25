# frozen_string_literal: true

require_relative './application_record'

class Match < ApplicationRecord
  has_many :players, through: :match_metrics
  has_many :metrics, through: :match_metrics
  has_and_belongs_to_many :teams

  validates :place, presence: true
  validates :date, presence: true
end
