import processing.sound.*;

int sB = 1;
int bB = 5;
boolean isRunning = false;
Button start;
Timer timer;
ArrayList<Effect> effects = new ArrayList<Effect>();
SoundFile sound;

public void setup()
{
  size(500, 500,P3D);
  textAlign(CENTER,CENTER);
  rectMode(CENTER);
  frameRate(60);

  start = new Button();
  timer = new Timer(30);
  sound = new SoundFile(this, "sound.mp3");
}

public void draw()
{
  background(0);

  if(frameCount % 10 == 0)
    effects.add(new Effect());
    
  for(int i = 0; i < effects.size(); i++)
  {
    effects.get(i).render();
    
    if(effects.get(i).checkBounds())
    {
      effects.remove(i);
      i--;
    }
  }
  
  fill(255);
  textSize(50);
  text("Small: $" + sB + " \nBig: $" + bB, width/2, height * .2);

  start.render();
  start.isClicked();
  
  if(isRunning && frameCount % 60 == 0)
    timer.update();
    
  timer.render();
}
