# frozen_string_literal: true

require 'equalize_team_size'

describe '#equalize_team_size' do
  it 'should return a Integer' do
    teams = [1, 2, 2, 3, 4]
    max_reduce = 2
    response = equalize_team_size(teams, max_reduce)
    expect(response).to be_a Integer
  end

  it 'should return the size of the teams when there is not equal size teams and we can reduce all the teams' do
    teams = [1, 2, 3, 4, 5, 6, 7]
    max_reduce = 10
    response = equalize_team_size(teams, max_reduce)
    expect(response).to eq(teams.size)
  end

  it 'should return the correct number of teams when there isnt equal size teams and we cannt reduce all the teams' do
    teams = [1, 7, 3, 8]
    max_reduce = 1
    response = equalize_team_size(teams, max_reduce)
    expect(response).to eq(max_reduce + 1)
  end

  it 'should return the correct number of teams when we can not reduce all of the teams and there are teams with equal size' do
    target_max_teams = 4
    teams = [1, 2, 2, 3, 4]
    max_reduce = 2
    response = equalize_team_size(teams, max_reduce)
    expect(response).to eq(target_max_teams)
  end

  it 'should return the correct number of teams when we can reduce more teams than the equal size teams plus the teams with more participants than the equal size teams' do
    teams = [1, 2, 3, 3, 4, 6, 7]
    max_reduce = 5
    response = equalize_team_size(teams, max_reduce)
    expect(response).to eq(max_reduce + 1)
  end

  it 'should return the correct number of teams when we can reduce more teams than the number of equal size teams that already are' do
    teams = [1, 2, 3, 4, 7, 7, 7]
    max_reduce = 4
    response = equalize_team_size(teams, max_reduce)
    expect(response).to eq(max_reduce + 1)
  end

  it 'should return the correct number of teams when we have equal size teams with the maximum number of participants and it is the same number than reduce the teams posibility' do
    target_max_teams = 3
    teams = [4, 7, 7, 7, 2, 1]
    max_reduce = 2
    response = equalize_team_size(teams, max_reduce)
    expect(response).to eq(target_max_teams)
  end

  it 'should return the correct number of teams when the equal size teams are more than the posibility to reduce teams' do
    target_max_teams = 4
    teams = [4, 7, 7, 7, 7, 2, 1]
    max_reduce = 2
    response = equalize_team_size(teams, max_reduce)
    expect(response).to eq(target_max_teams)
  end

  it 'should return the correct number of teams when we can take equal size teams and we can reduce all the other teams available' do
    target_max_teams = 8
    teams = [4, 7, 7, 7, 2, 1, 1, 3]
    max_reduce = 6
    response = equalize_team_size(teams, max_reduce)
    expect(response).to eq(target_max_teams)
  end
end
