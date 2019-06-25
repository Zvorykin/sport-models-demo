# frozen_string_literal: true

require_relative './application_record'

class Match < ApplicationRecord
  has_and_belongs_to_many :players

end
