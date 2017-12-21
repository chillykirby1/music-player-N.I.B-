import processing.sound.*;

//note:in order to go to next song you hit the next song button then hit play if play is not hit it will not play

int totalSongs = 5;
SoundFile[] song = new SoundFile[totalSongs];
int indexSong = 0;

void setup() {
  size (600, 600); 
  background(0);
  fill(255);
  ellipse(300, 400, 100, 100);
  triangle(380, 450, 430, 400, 380, 350);
  fill(255);
  rect(0, 0, 300, 600);
  fill(0);
  triangle(230, 450, 180, 400, 230, 350);

  song[0] = new SoundFile(this, "Newsroom.mp3");
  song[1] = new SoundFile(this, "Ghost_Walk.mp3");
  song[2] = new SoundFile(this, "Eureka.mp3");
  song[3] = new SoundFile(this, "Cycles.mp3");
  song[4] = new SoundFile(this, "Beat_Your_Competition.mp3");
}

void draw() {
    fill(255);
    textSize(255);
    text(".B",350,300);
    rect(300,115,15,200);
    fill(0);
     textSize(25);
    text("s=play",0,15);
    text("x=stop",0,35);
    text("a=last song",0,55);
    text("d=next song",0,80);
    text("total songs=5",0,580);
    rect(285,115,15,200);
    fill(#FF0000);
    rect(500, 550, 100, 50);
  if (mouseX > 500 && mouseX < 600 && mouseY > 550 && mouseY < 600) {
    fill(#6A0101);
    rect(500,550,100,50);
  } else {
    fill(#FF0000);
    rect(500,550,100,50);
    fill(0);
    textSize(255);
    text("N.", 1, 300); 
    fill(0, 102, 153);
    fill(0);

    arc(300,400,100,100,PI-HALF_PI,TWO_PI-HALF_PI);
  }
}

void keyPressed() {

  println ("Current Key Pressed: " + key);
  println ("Current Song Number is: " + indexSong + ".\n");

  if (indexSong < 0 | indexSong >= song.length) {
    if (indexSong < 0) {
      indexSong = 0;
      println("You are pressing the Previous Button a lot \n" +
        "Please press the Next Button or the Play Button.");
      println("Your song number is changed to " + indexSong + ".");
    } else {
      indexSong = song.length - 1;
      println ("You are at the end of the song list, \n" +
        "Press the Previous Song or Play Keys");
      //println("You are pressing the Next Button a lot \n" +
      //"Please press the Back Button or the Play Button.");
      println("Your song number is changed to " + indexSong + ".");
    }
  }

  switch(key) {
  case 's':
  case 'S':
    println("Playing song " + indexSong + ".");
    song[indexSong].play();
    break;
  case 'x':
  case 'X':
    song[indexSong].stop();
    println ("You have stopped playing song " + indexSong + ".");
    break;
  case 'a':
  case 'A':
    println("Choosing previous song");
    song[indexSong].stop();
    indexSong = indexSong - 1;
    println ("Current Song Number is: " + indexSong);
    break;
  case 'd':
  case 'D':
    println("Choosing next song");
    song[indexSong].stop(); 
    indexSong = indexSong + 1; 
    println ("Current Song Number is: " + indexSong);
    break;
  default:
    println("\nPress the \'a\', \'s\', \'d\', or \'x\' keys for control.\n\n");
  }
}

void mousePressed() {
  if (mouseX>=500 && mouseX <=600 && mouseY>=550 && mouseY<=600) {
    exit ();
  }
}