import processing.sound.*;
AudioIn in;
SoundFile sample;

Waveform waveform;

int samples = 700;

int p = 100;

public void setup(){
  
  size(1920, 1080);

  sample = new SoundFile(this, "wow.mp3");

  sample.loop();
  in = new AudioIn(this, 0);
  waveform = new Waveform(this, samples);

  waveform.input(sample);

  
  
  //frameRate(100);

}
public void draw()
{
  background(0);
  stroke(0,255,0);
  strokeWeight(1.75);
  noFill();
  waveform.analyze();
  //push();
  //for (int i = 100; i<width; i+=p){
  //strokeWeight(0.5);
  //line(i, 0, i, height);
  //}
  //for (int x = 100; x<height; x+=p){
      //strokeWeight(0.5);
      //line(0, x, width, x);
        //}
  //pop();

  

  beginShape();
  for(int i = 0; i < samples-200; i++)
  {
    curveVertex(
      map(waveform.data[i], -1, 1, 0, width),
      map(waveform.data[i+200], -1, 1, 0, height)
    );

  }
  endShape();

 

}
