# frozen_string_literal: true

def equalize_team_size(teams, max_reduce)
  n = teams.size
  return n if max_reduce >= n

  equal_size_teams = equal_size_teams(teams)
  teams_can_reduce = teams_can_reduce(teams)
  count = equal_size_teams.size + 1
  return n if max_reduce + 1 == n
  return max_reduce + 1 if equal_size_teams.size.zero? || max_reduce == (count + teams_can_reduce)
  return max_reduce + 1 if max_reduce > teams_can_reduce && (count + teams_can_reduce < max_reduce)
  return count + teams_can_reduce if teams_can_reduce <= max_reduce
  return count + max_reduce if max_reduce < n && max_reduce > teams_can_reduce
end

def equal_size_teams(teams)
  teams.sort!.select.with_index { |team, idx| team == teams[idx + 1] }
end

def teams_can_reduce(teams)
  teams_can_reduce = teams.sort!.reject.with_index do |team, idx|
    team == teams[idx + 1]
  end
  teams_can_reduce.delete_if do |team|
    team == equal_size_teams(teams)[0] || (team < equal_size_teams(teams)[0]) if equal_size_teams(teams)[0]
  end.size
end

# puts 'Ejercicio 1'
# array1 = [1, 2, 2, 3, 4]
# k1 = 2
# puts equalize_team_size(array1, k1)
# # Result = 4
# puts 'Ejercicio 2'
# array2 = [1, 7, 3, 8]
# k2 = 1
# puts equalize_team_size(array2, k2)
# # Result = 2
# puts 'Ejercicio 3'
# array3 = [1, 2, 3, 4, 5, 6, 7]
# k3 = 10
# puts equalize_team_size(array3, k3)
# # Result = 7
# puts 'Ejercicio 4'
# array4 = [1, 2, 3, 3, 4, 6, 7]
# k4 = 5
# puts equalize_team_size(array4, k4)
# # Result = 5
# puts 'Ejercicio 5'
# array5 = [1, 2, 3, 4, 7, 7, 7]
# k5 = 4
# puts equalize_team_size(array5, k5)
# # Result = 5
# puts 'Ejercicio 6'
# array6 = [4, 7, 7, 7, 2, 1]
# k6 = 2
# puts equalize_team_size(array6, k6)
# # Result = 3
# puts 'Ejercicio 7'
# array6 = [4, 7, 7, 7, 2, 1, 1]
# k6 = 6
# puts equalize_team_size(array6, k6)
# # Result = 7
