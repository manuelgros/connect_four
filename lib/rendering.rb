# frozen_string_literal: true

# Rendering module for presentation in command line
module Rendering
  # def display_board(board_hash)
  #   puts "#{board_hash.each { |key, value| print value + ' ' if key[0] == 5 }}"
  #   puts "#{board_hash.each { |key, value| print value + ' ' if key[0] == 4 }}"
  #   puts "#{board_hash.each { |key, value| print value + ' ' if key[0] == 3 }}"
  #   puts "#{board_hash.each { |key, value| print value + ' ' if key[0] == 2 }}"
  #   puts "#{board_hash.each { |key, value| print value + ' ' if key[0] == 1 }}"
  #   puts "#{board_hash.each { |key, value| print value + ' ' if key[0] == 0 }}"
  # end

  # rubocop:disable Layout/LineLength
  def display_board(board_hash)
    puts "#{board_hash[[0, 5]]} #{board_hash[[1, 5]]} #{board_hash[[2, 5]]} #{board_hash[[3, 5]]} #{board_hash[[4, 5]]} #{board_hash[[5, 5]]} #{board_hash[[6, 5]]}\n
#{board_hash[[0, 4]]} #{board_hash[[1, 4]]} #{board_hash[[2, 4]]} #{board_hash[[3, 4]]} #{board_hash[[4, 4]]} #{board_hash[[5, 4]]} #{board_hash[[6, 4]]}\n
#{board_hash[[0, 3]]} #{board_hash[[1, 3]]} #{board_hash[[2, 3]]} #{board_hash[[3, 3]]} #{board_hash[[4, 3]]} #{board_hash[[5, 3]]} #{board_hash[[6, 3]]}\n
#{board_hash[[0, 2]]} #{board_hash[[1, 2]]} #{board_hash[[2, 2]]} #{board_hash[[3, 2]]} #{board_hash[[4, 2]]} #{board_hash[[5, 2]]} #{board_hash[[6, 2]]}\n
#{board_hash[[0, 1]]} #{board_hash[[1, 1]]} #{board_hash[[2, 1]]} #{board_hash[[3, 1]]} #{board_hash[[4, 1]]} #{board_hash[[5, 1]]} #{board_hash[[6, 1]]}\n
#{board_hash[[0, 0]]} #{board_hash[[1, 0]]} #{board_hash[[2, 0]]} #{board_hash[[3, 0]]} #{board_hash[[4, 0]]} #{board_hash[[5, 0]]} #{board_hash[[6, 0]]}"
  end

  def render(hash)
    hash.each_with_object({}) do |(key, value), new_hash|
      if value.nil?
        new_hash[key] = ' 🔳 '
      elsif value == '1'
        new_hash[key] = ' 🔴 '
      elsif value == '2'
        new_hash[key] = ' 🟡 '
      end
      new_hash
    end
  end
end
