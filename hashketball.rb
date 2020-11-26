require 'pry'

# Write your code below game_hash
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


def num_points_scored(player_name)
  # Takes a player's name as an argument & returns # of points scored for that player
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
      # what is 'data' at each loop throughout .each block? when will the following line of code work and when will it break?
        data.each do |data_item|
          if data_item[:player_name] == player_name
             return data_item[:points]
          end
        end
      end
    end
  end
end


def shoe_size(player_name)
  # Takes a player's name as an argument & returns shoe size of the correct player
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |data_item|
          if data_item[:player_name] == player_name
             return data_item[:shoe]
          end
        end
      end
    end
  end
end


def team_colors(team_name)
  # Takes a team name as an argument & returns team colors as an array
  game_hash.each do |location, team_data|
    if game_hash[location][:team_name] == team_name
      return game_hash[location][:colors]
    end
  end
end


def team_names
  # Operates on the game hash to return an array of team names
  team_names = []
  
  team_names << game_hash[:home][:team_name]
  team_names << game_hash[:away][:team_name]
  
  team_names
end


def player_numbers(team_name)
  # Takes an argument of a team name and returns an array of jersey numbers for the team
  jersey_numbers = []
  
  game_hash.each do |location, team_data|
    if game_hash[location][:team_name] == team_name
      team_data.each do |attribute, data|
        if attribute == :players
          data.each do |data_item|
            jersey_numbers << data_item[:number]
          end
        end
      end
    end
  end
  jersey_numbers
end


def player_stats(player_name)
  # Takes an argument of a player's name and returns a hash of player stats
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |data_item|
          if data_item[:player_name] == player_name
            return data_item
          end
        end
      end
    end
  end
end


def big_shoe_rebounds
  # Returns the number of rebounds associated with the player that has the largest shoe size
  number_rebounds = 0
  biggest_shoe = 0
  
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |data_item|
          if data_item[:shoe] > biggest_shoe
            biggest_shoe = data_item[:shoe]
            number_rebounds = data_item[:rebounds]
          end
        end
      end
    end
  end
  
  number_rebounds
end


### BONUS METHODS ###
def most_points_scored
  # Which player has the most points?
  mvp = ""
  points_scored = 0
  
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |data_item|
          if data_item[:points] > points_scored
            mvp = data_item[:player_name]
            points_scored = data_item[:points]
          end
        end
      end
    end
  end
  mvp
end


def winning_team
  # Which team has the most points?
  home_points = []
  away_points = []
    
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |data_item|
          if location == :home
            home_points << data_item[:points]
          else
            away_points << data_item[:points]
          end
        end
      end
    end
  end
  
  home_points = home_points.reduce(:+)
  away_points = away_points.reduce(:+)
  
  if home_points > away_points
    game_hash[:home][:team_name]
  elsif home_points < away_points
    game_hash[:away][:team_name]
  end
end


def player_with_longest_name
  # Which player has the longest name?
  longest_name = ""
  
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |data_item|
          if data_item[:player_name].length > longest_name.length
            longest_name = data_item[:player_name]
          end
        end
      end
    end
  end
  
  longest_name
end


def most_steals
  # Which player has the most steals?
  msp = ""
  most_steals = 0
  
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |data_item|
          if data_item[:steals] > most_steals
             msp = data_item[:player_name]
             most_steals = data_item[:steals]
          end
        end
      end
    end
    msp
  end
  
  msp
end


def long_name_steals_a_ton?
  # Return true if the player with the longest name had the most steals
  player_with_longest_name == most_steals
end

puts most_points_scored
puts winning_team
puts player_with_longest_name
puts most_steals
puts long_name_steals_a_ton?