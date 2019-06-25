# frozen_string_literal: true

require_relative './application_record'

class MatchMetrics < ApplicationRecord
  has_one :player
  has_one :metric
  has_one :match
end
