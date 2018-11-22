using System;
using System.Collections.Generic;

namespace src
{
    public enum PlayerStatus {
        NEWBIE,
        STANDARD,
        ELITE,
        SPONSORED
    }

    public class Player: IComparable<Player>
    {
        public Player(int id, DateTime lastPlayed, PlayerStatus status){
            this.Id = id;
            this.LastPlayed = lastPlayed;
            this.Status = status;
        }
        
        public int Id{get; private set;}

        public DateTime LastPlayed{get; private set;}

        public PlayerStatus Status{get; private set;}

        public int CompareTo(Player other){
            if(this.Id == other.Id)
                return 0;
            if( this.Status != other.Status)
                return this.Status < other.Status ? -1: 1;
            if( this.LastPlayed != other.LastPlayed)
                return this.LastPlayed.CompareTo(other.LastPlayed);
            return this.Id.CompareTo(other.Id);
        }
    }
}
