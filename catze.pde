import processing.sound.*;

AudioIn in;
PImage fly; // Definition
PImage backgroundImage; // Hintergrundbild
float flyX;
float flyY;
float speed = 16.0; // Geschwindigkeit
SoundFile music;
SoundFile meow;

float musicVolume = 0.5; // Standardlautstärke für die Hintergrundmusik
float meowVolume = 1.0; // Standardlautstärke für das Miauen

void setup() {
  size(1200, 1200);
  
  // Hintergrundbild laden
  backgroundImage = loadImage("rainbowg.jpg"); 
  
  // Setzen Sie das Hintergrundbild als Hintergrund
  background(backgroundImage);
  
  fly = loadImage("images.png"); // Bild der fliegenden Katze
  flyX = width / 2;
  flyY = height / 2;

  // Create the Input stream
  in = new AudioIn(this, 0);
  in.start();

  // Hintergrundmusik laden
  music = new SoundFile(this, "music.wav.wav");
  if (music != null) {
    music.amp(musicVolume); // Lautstärke für die Hintergrundmusik einstellen
    music.loop(); // Hintergrundmusik in Schleife abspielen
  } else {
    println("Fehler beim Laden der Hintergrundmusik!");
  }
}

void draw() {
  // Hintergrundbild neu zeichnen
  background(backgroundImage);

  // Katze zeichnen
  image(fly, flyX, flyY);
}

void keyPressed() {
  if (keyCode == UP) {
    flyY -= speed; // Bewege die Katze nach oben
  } else if (keyCode == DOWN) {
    flyY += speed; // Bewege die Katze nach unten
  } else if (keyCode == LEFT) {
    flyX -= speed; // Bewege die Katze nach links
  } else if (keyCode == RIGHT) {
    flyX += speed; // Bewege die Katze nach rechts
  } else if (key == 'q' || key == 'Q') {
    miau(); // Miau auslösen, wenn die Taste 'Q' gedrückt wird
  } else if (key == '+' || key == '=') {
    increaseVolume(); // Lautstärke erhöhen, wenn die Taste '+' oder '=' gedrückt wird
  } else if (key == '-' || key == '_') {
    decreaseVolume(); // Lautstärke verringern, wenn die Taste '-' oder '_' gedrückt wird
  }
}

void miau() {
  meow = new SoundFile(this, "funny-meow-110120.wav");
  if (meow != null) {
    meow.amp(meowVolume); // Lautstärke für den Meow-Sound einstellen
    meow.play();
  } else {
    println("Fehler beim Laden des Meow-Sounds!");
  }
}

void increaseVolume() {
  musicVolume = constrain(musicVolume + 0.1, 0.0, 1.0); // Lautstärke der Hintergrundmusik um 0.1 erhöhen, begrenzt auf den Bereich 0.0 bis 1.0
  music.amp(musicVolume);

  meowVolume = constrain(meowVolume + 0.1, 0.0, 1.0); // Lautstärke des Miauens um 0.1 erhöhen, begrenzt auf den Bereich 0.0 bis 1.0
  if (meow != null) {
    meow.amp(meowVolume);
  }
}

void decreaseVolume() {
  musicVolume = constrain(musicVolume - 0.1, 0.0, 1.0); // Lautstärke der Hintergrundmusik um 0.1 verringern, begrenzt auf den Bereich 0.0 bis 1.0
  music.amp(musicVolume);

  meowVolume = constrain(meowVolume - 0.1, 0.0, 1.0); // Lautstärke des Miauens um 0.1 verringern, begrenzt auf den Bereich 0.0 bis 1.0
  if (meow != null) {
    meow.amp(meowVolume);
  }
}
//Quelle: Sounds: Pixabay.com 
//Hintergund: https://www.deviantart.com/clefairykid/art/Paradise-609748534 
//Katze: google.com
