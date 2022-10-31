import controlP5.*;
import processing.sound.*;
ControlP5 button;
ControlP5 colorpicker;
SoundFile file;
// DON'T FORGET TO CHANGE path name below according to where you store the file
String audioName = "/Users/amari/Downloads/sketch_52685A3/What Love Is (Because You Died) Fin.mp3";
String path;
int from = color(255, 0, 0);
int to = color(0, 120, 200);
boolean click = false;

void setup() {
  size(700, 500);
  background(0);
  noStroke();
  ellipseMode(CENTER);
  rectMode(CENTER);
  path = sketchPath(audioName);
  file = new SoundFile(this, path);
  
//Create Start Screen
  fill(255);
  rect(350, 180, 625, 325);
  textAlign(CENTER);
  textSize(15);
  fill(255,52,126);
  text("You yourselves are a case study of what he does. \n At one time you all had your backs turned to God, \n thinking rebellious thoughts of him, giving him trouble every chance you got. \n But now, by giving himself completely at the Cross, actually dying for you,\n Christ brought you over to God’s side and put your lives together, whole and holy in his presence.\n You don’t walk away from a gift like that!\n You stay grounded and steady in that bond of trust,\n constantly tuned in to the Message, careful not to be distracted or diverted.\n There is no other Message—just this one.\n Every creature under heaven gets this same Message.\n I, Paul, am a messenger of this Message.\n -Colossians 1:21-23-", 350, 50);
  fill(224, 252, 41); 
  textSize(25);
  text("Click anywhere to begin", width/2, height*5/6);

//Create slider
  button = new ControlP5(this);
  PFont p = createFont("Roboto Medium.vlw", 20);
  ControlFont font = new ControlFont(p);
  button.setColorBackground(color(150, 158, 159));
  button.setFont(font);
  button.addSlider("vol")
    .setRange(0, 100)
    .setValue(20)
    .setPosition(100, 400)
    .setSize(500, 50)
    .setColorValue(200)
    .setColorLabel(200);
  button.setVisible(false);
}

void draw () {
  if (click==true) {
    background(0);
    fill(255);
    textSize(10);
    text("You can:\n 1. Hover your mouse around to change the size and position of the circles\n 2. Press l-o-v-e on your keyboard\n 3. Press any other keys on your keyboard\n Enjoy!", 350, 20);
    
   // Create moving circles
    fill(255, 140, 0);
    ellipse(mouseX, height/2, mouseY/2+15, mouseY/2+15);
    fill(255, 140, 0);
    int inverseX = width-mouseX;
    int inverseY = height-mouseY;
    ellipse(inverseX, height/2, (inverseY/2)+20, (inverseY/2)+20);
   // Create small, random stars 
    fill(0,10);
    rect(0,0, 1400, 1000);
    fill(255);
    ellipse(random(width), random(height), 2, 2);
    
   
  }
  // Increase song volume
  if (mousePressed) {
    float amplitude = map(mouseX, 0, height, 0, 1.0);
    file.amp(amplitude);
  }
  // Create stars
  if (keyPressed == true) {
    fill(255, 10);
    rect(0, 0, 1400, 1000);
    fill(255, 255, 102);
    ellipse(random(width), random(height), 7, 7);
    
  // Create cross equals love
    if(key == 'l' | key == 'o' | key == 'v'| key == 'e'){
    fill(255);
    rect(0, 0, 1500, 1000);
    smooth();
    fill(255, 182, 193);
    beginShape();
    vertex(500, 200);
    bezierVertex(500, 67, 700, 67, 500, 325);
    vertex(500, 200);
    bezierVertex(500, 67, 300, 67, 500, 325);
    endShape();
    rect(200, 180, 150, 20);
    rect(200, 220, 20, 200);
    rect(330, 220, 60, 15);
    rect(330, 240, 60, 15);
    }
  }
}
// For Start Screen
void mouseClicked() {
  file.loop();
  click=true;
  button.setVisible(true);
  
}
