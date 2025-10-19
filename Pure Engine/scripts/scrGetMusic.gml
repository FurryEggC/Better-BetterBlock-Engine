///gets which song is supposed to be playing for the current room and plays it

var roomSong;

switch (room)                       //determines which song to play
{
    case rTitle:                    //add rooms here, if you have several rooms that play the same song they can be put together
    case rMenu:
    case rOptions:
    case rDifficultySelect:
        roomSong = musNull;  // use musNull instear of -1 to prevent bugs
        break;
    case rSampleRoom:
        roomSong = musGuyRock;
        break;
    default:                        //default option in case the room does not have a song set
        roomSong = musNull;
        break;
}

if (roomSong != -2)
    scrPlayMusic(roomSong,true); //play the song for the current room
