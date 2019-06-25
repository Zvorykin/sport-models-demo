# frozen_string_literal: true

# Models
Dir[File.join(__dir__, 'models', '*.rb')].each { |file| require file }

Team.create!([
               { name: 'First' },
               { name: 'Second' },
               { name: 'Third' }
             ])

Metric.create!([
                 { name: 'Run for >10 km' },
                 { name: 'Made >70% successful passes' },
                 { name: 'Made >2 goals during the match' }
               ])

Player.create!([
                 { name: 'Mike', team_id: 1 },
                 { name: 'Pete', team_id: 1 },
                 { name: 'Jack', team_id: 1 },
                 { name: 'John', team_id: 2 },
                 { name: 'Barney', team_id: 2 },
                 { name: 'Luke', team_id: 2 },
                 { name: 'Karl', team_id: 3 },
                 { name: 'James', team_id: 3 },
                 { name: 'Mat', team_id: 3 }
               ])

Match.create!([
                { place: 'Stadium 1', date: '2019-01-01', teams: Team.where(id: [1, 2]) },
                { place: 'Stadium 2', date: '2019-03-05', teams: Team.where(id: [1, 2]) },
                { place: 'Stadium Arcadium!', date: '2019-05-12', teams: Team.where(id: [2, 3]) },
                { place: 'Stadium 4', date: '2019-06-16', teams: Team.where(id: [1, 3]) },
                { place: 'Stadium 5', date: '2019-07-18', teams: Team.where(id: [2, 3]) }
              ])

# The most important part
MatchMetrics.create!([
                       { player_id: 1, metric_id: 1, match_id: 1 },
                       { player_id: 1, metric_id: 2, match_id: 1 },
                       { player_id: 2, metric_id: 1, match_id: 1 },
                       { player_id: 4, metric_id: 1, match_id: 1 },
                       { player_id: 4, metric_id: 1, match_id: 3 },
                       { player_id: 4, metric_id: 1, match_id: 4 },
                       { player_id: 5, metric_id: 3, match_id: 3 },
                       { player_id: 6, metric_id: 1, match_id: 4 },
                       { player_id: 6, metric_id: 1, match_id: 5 },
                       { player_id: 7, metric_id: 1, match_id: 5 },
                       { player_id: 8, metric_id: 1, match_id: 5 },
                       { player_id: 9, metric_id: 1, match_id: 5 }
                     ])
