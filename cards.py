'''Classes used to implement poker and go-fish'''

class Deck(object):
	'''A collection of cards'''
	def __init__(self, cards=[], size=52):
		self.cards = cards
		self.size = 52

	def shuffle(self):
		# randomize card order in cards
		pass

class Hand(Deck):
	'''An unordered collection of cards'''
	def __init__(self, hand=[], size=5):
		self.hand = hand
		self.size = size

	def draw(self, card):
		if len(self.hand) > 4:
			print('Your hand is full.')
		else:
			self.hand = self.hand.append(card)

	def view_hand(self):
		if len(self.hand) > 0:
			for card in self.hand:
				print(card.label + ' ' + card.suit + ' ' + card.value)
		else:
			print('Your hand is empty.')

	def 

class DiscardPile(Deck):
	'''The complement of a Deck'''
	def __init__(self, cards=[]):
		self.cards = cards


class Card(object):
	'''A suited and number card'''
	CARD_POINTS	= {	'JK' : 0,
					'2' : 2,
					'3' : 3,
					'4' : 4,
					'5' : 5,
					'6' : 6,
					'7' : 7,
					'8' : 8,
					'9' : 9,
					'10' : 10,
					'J' : 11,
					'Q' : 12,
					'K' : 13,
					'A' : 14  }

	CARD_SUITS = ['spade', 'heart', 'diamond', 'club']

	def __init__(self, suit='spade', label='Jk', value=CARD_POINTS[label]):
		self.suit = suit
		self.label = label
		self.value = value

