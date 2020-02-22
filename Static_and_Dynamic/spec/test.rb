require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../card.rb')
require_relative('../card_game.rb')

class CardGameTest < Minitest::Test

def setup
@card1 = Card.new("clubs", 4)
@card2 = Card.new("spades", 1)
@cards = [@card1, @card2]
@card_game = CardGame.new(@cards)
end

def test_card_game_has_cards
  assert_equal(2, @card_game.cards.count)
end

def test_can_get_cards
  assert_equal([@card1, @card2], @card_game.cards)
end

def test_can_check_cards_for_ace
  cards = @card_game.cards
  assert_equal(true, @card_game.check_for_Ace(@cards))
end

def test_can_identify_highest_card
  assert_equal(@card1, @card_game.highest_card(@card1, @card2))
end

def test_can_get_total_value_of_cards
  assert_equal("You have a total of 5", @card_game.cards_total(@cards))
end

end
