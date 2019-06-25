# frozen_string_literal: true

require_relative './application_record'

class Player < ApplicationRecord
  belongs_to :team
  has_many :metrics, through: :match_metrics

  validates :name, presence: true, uniqueness: true
end
