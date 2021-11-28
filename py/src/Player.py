from enum import Enum
from datetime import datetime

class PlayerStatus(Enum):
  """An enum of possible Player status values
  """
  NEWBIE = 1
  STANDARD = 2
  ELITE = 3
  SPONSORED = 99

class Player():
  """A Player of games
  """
  def __init__(self, id: int, last_played: datetime, status: PlayerStatus):
    """Create a new player
    : param int id: The id of the player
    : param datetime last_played: The last date/time the the player has a game
    : param PlayerStatus status: The ranking status of the player
    """
    self.id = id
    self.last_played = last_played
    self.status = status

  def compare_to(self, other) -> int:
    """Compare this player to another
    :param other Player: Another player to compare to this one
    :return: either -1: self<other, 0: self==other, +1: self>other
    """
    if self.id == other.id:
      return 0
    if self.status != other.status:
      return -1 if self.status < other.status else 1
    if self.last_played != other.last_played:
      return -1 if self.last_played < other.last_played else 1
    return -1 if self.id < other.id else 1
