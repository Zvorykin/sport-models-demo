# frozen_string_literal: true

require_relative './application_record'

class MatchMetrics < ApplicationRecord
  belongs_to :player
  belongs_to :match
  belongs_to :metric
end
