require 'open-uri'
require 'json'

class GamesController < ApplicationController

  def new
    @grid = Array.new(25) { ('a'..'z').to_a.sample }
  end

  def score
      @word = params[:result]
      def english_word?(word)
        response = URI.open("https://wagon-dictionary.herokuapp.com/#{word}")
        json = JSON.parse(response.read)
        json['found']
      end
  end

  # private


    # result = run_game(@word, params[:grid], params[:start_time].to_time, Time.now)
    # @score = result[:score]
    # @message = result[:message]
    # @time = result[:time]

#   def included?(guess, grid)
#     guess.chars.all? { |letter| guess.count(letter) <= grid.count(letter) }
#   end

#   def compute_score(attempt, time_taken)
#     time_taken > 60.0 ? 0 : (attempt.size * (1.0 - (time_taken / 60.0)))
#   end



#   def score_and_message(attempt, grid, time_taken)
#     if included?(attempt.upcase, grid)
#       if english_word?(attempt)
#         score = compute_score(attempt, time_taken)
#         [score, "Well done!"]
#       else
#         [0, "Not an English word."]
#       end
#     else
#       [0, "Not in the grid."]
#     end
#   end

#   def run_game(attempt, grid, start_time, end_time)
#     result = { time: end_time - start_time }
#     score, message = score_and_message(attempt, grid, result[:time])
#     result[:score] = score
#     result[:message] = message
#     result
#   end
end
