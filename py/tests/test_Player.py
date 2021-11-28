from unittest import TestCase
from datetime import datetime
from src import Player, PlayerStatus


class TestHangman(TestCase):
    def test_1(self):
      player = Player(1, datetime.now, PlayerStatus.NEWBIE)
      self.fail(f'Do something here with {player}')