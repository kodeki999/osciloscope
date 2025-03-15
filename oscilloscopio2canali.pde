import processing.sound.*;
AudioIn in;
SoundFile sample1;
SoundFile sample2;
SoundFile sample;

Waveform waveform1;
Waveform waveform2;

int samples = 450;



public void setup(){
  
  size(1080, 720);
  sample = new SoundFile(this, "bigger.wav");
  sample1 = new SoundFile(this, "ch1xx.wav");
  sample2 = new SoundFile(this, "ch2xx.wav");



  sample1.loop();
  sample2.loop();
  //n = new AudioIn(this, 0);
  waveform1 = new Waveform(this, samples);
  waveform2 = new Waveform(this, samples);
  //sample.pan(-1);
  
  waveform1.input(sample1);
  waveform2.input(sample2);
  println(sample.frames()/sample.duration());
  
  
  frameRate(100);

}
public void draw()
{
  background(0);
  stroke(255,0,0);
  strokeWeight(1.75);
  noFill();
  waveform1.analyze();
  waveform2.analyze();

  beginShape();
  for(int i = 0; i < samples; i++)
  {
    curveVertex(
      map(waveform1.data[i], -1, 1, 0, width),
      map(waveform2.data[i], -1, 1, 0, height)
    );

  }
  endShape();

 

}
