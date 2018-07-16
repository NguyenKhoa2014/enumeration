require 'active_support/all'
# In this file we define the methods to help filter out candidates
# This way, we keep these methods separated from other potential parts of the program

def find(id)
   @candidates.detect { |i| i[:id] == id}
  # Your code Here
end

def experienced?(candidate)
  # Your code Here
  if(candidate[:years_of_experience] >=2)
    return true
  else 
    return false
  end

end

def find_in_array(input)
   input.detect{ |i| i == 'Python' || i == 'Ruby' }
end

def applied_within(day_apply)
    
   today = 0.day.ago.to_date
   total_days = today - day_apply
   if (total_days.to_i <= 15)
     puts total_days 
     return true
   end
    
end
 

def qualified_candidates(candidates)
  exp_candidates =  
    candidates.select{|candidate| candidate[:years_of_experience] >=2 &&
    candidate[:github_points] >=100 && 
    find_in_array(candidate[:languages]) &&
    applied_within(candidate[:date_applied]) && candidate[:age] > 17}
  
  # Your code Here
  
  return exp_candidates
end



# More methods will go below
def ordered_by_qualifications(candidates)
  candidates.sort{ |a,b| [ a[:years_of_experience], a[:github_points] ] <=> [ b[:years_of_experience], b[:github_points] ] }.reverse
end  