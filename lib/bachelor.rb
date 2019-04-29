require "pry"

def get_first_name_of_season_winner(data, season)
  a = data[season] # We do this to make it simpler to isolate the array of hashes contained inside the data hash
  i = 0
  until i > a.length 
    a.each do |candidate_hash| # This ensures we look at all of the hashes inside the array inside the data hash
      if candidate_hash.fetch("status") == "Winner" # Checks the key=>value pair for "status" of an individual array element (which is in this case one candidate hash)
        return candidate_hash.fetch("name").split(" ")[0] # returns "Firstname Secondname" and then splits into an array to select the Firstname only
      else
        nil
      end
    end
    i += 1
  end
end

def get_contestant_name(data, job)
  data.each do |season, array|
    a = data[season]
 
      a.each do |candidate_hash| 
        if candidate_hash.fetch("occupation") == job
          return candidate_hash.fetch("name")
        else
          nil
        end
      end
    end
end

def count_contestants_by_hometown(data, location)
  location_array = []
  data.collect do |season, array|
    a = data[season] 
      a.collect do |candidate_hash|
        if candidate_hash.fetch("hometown") == location
          location_array << candidate_hash.fetch("hometown")
        end
      end
  end
  location_array.length
end

def get_occupation(data, location)
  data.each do |season, array|
    a = data[season]
      a.each do |candidate_hash| 
        if candidate_hash.fetch("hometown") == location
          return candidate_hash.fetch("occupation")
        else
          nil
        end
      end
    end
end

def get_average_age_for_season(data, season_number)
  age_array = []
  i = 0
  until i == data[season_number].length # BE SUPER CAREFUL HERE - there was an ongoing error becuase i > array.length returned a null value. Use (while i <) and (until i ==)
    age_array << data[season_number][i]["age"].to_f
      i += 1
    end
  average_age = age_array.sum / age_array.length
  average_age.round
end