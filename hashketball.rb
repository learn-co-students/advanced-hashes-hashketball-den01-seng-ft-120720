# Write your code below game_hash
require 'pry'
def game_hash
  {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: [
        {
          player_name: "Alan Anderson",
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        },
        {
          player_name: "Reggie Evans",
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        },
        {
          player_name: "Brook Lopez",
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        },
        {
          player_name: "Mason Plumlee",
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 11,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        },
        {
          player_name: "Jason Terry",
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1
        }
      ]
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: [
        {
          player_name: "Jeff Adrien",
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        },
        {
          player_name: "Bismack Biyombo",
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 22,
          blocks: 15,
          slam_dunks: 10
        },
        {
          player_name: "DeSagna Diop",
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        },
        {
          player_name: "Ben Gordon",
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        },
        {
          player_name: "Kemba Walker",
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 7,
          blocks: 5,
          slam_dunks: 12
        }
      ]
    }
  }
end

# Write code here
def num_points_scored(players_name)
  game_hash.each do |key, values|
    values.each do |key_2, values_2|
      if key_2 == :players
        values_2.each do |key_player|
          if key_player.has_value?(players_name)
            return key_player[:points]
          end
        end
      end
    end
  end
end

def shoe_size(players_name)
  game_hash.each do |key, values|
    values.each do |key_2, values_2|
      if key_2 == :players
        values_2.each do |key_player|
          if key_player.has_value?(players_name)
            return key_player[:shoe]
          end
        end
      end
    end
  end
end

def team_colors(team_name)
  game_hash.each do |key, value|
    value.each do |key_2,value_2|
      if value_2 == team_name
        return game_hash[key][:colors]
      end
    end
  end
end

def team_names
  teams = game_hash.each_with_object([]) do |(key,value), team_array|
    value.each do |key_2,value_2|
      if key_2 == :team_name
        team_array.push(value_2)
      end
    end
  end
  teams
end

def player_numbers(team_name)
  numbers = game_hash.each_with_object([]) do |(key,value), numbers_array|
    value.each do |key_2, value_2|
      if value_2 == team_name
        game_hash[key][:players].each do |stats|
          numbers_array.push(stats[:number])
        end
      end
    end
  end
  numbers
end

def player_stats(player_name)
  stats = game_hash.each_with_object([]) do |(key,value), stats_array|
    value.each do |key_2,value_2|
      if key_2 == :players
        value_2.each do |player_stats|
          if player_stats.has_value?(player_name)
            stats_array.push(player_stats)
          end
        end
      end
    end
  end
  stats[0]
end

def big_shoe_rebounds
  most_rebounds = 0
  largest_shoe = 0
  largest_shoe_player = ""
  
  game_hash.each do |key,value|
    value.each do |key_2,value_2|
      if key_2 == :players
        value_2.each do |stats|
          if stats[:shoe] > largest_shoe
            largest_shoe = stats[:shoe]
            most_rebounds = stats[:rebounds]
            largest_shoe_player = stats[:player_name]
          end
        end
      end
    end
  end
  most_rebounds
end







