# frozen_string_literal: true

# Models
Dir[File.join(__dir__, 'models', '*.rb')].each { |file| require file }

Metric.create!([
                 { name: 'Run for >10 km' },
                 { name: 'Made >70% successful passes' },
                 { name: 'Made >2 goals during the match' }
               ])

Player.create!([
                 { name: 'Mike' },
                 { name: 'Pete' },
                 { name: 'Jack' },
                 { name: 'John' },
                 { name: 'Barney' },
                 { name: 'Luke' },
                 { name: 'Karl' },
                 { name: 'James' },
                 { name: 'Mat' }
               ])

