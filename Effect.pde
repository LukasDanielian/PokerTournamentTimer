public class Effect
{
  float x,y,xMover,yMover,rotX,rotZ;
  float r,g,b;
  PShape chip;
  String[] amounts = {"1","5","10","25","50","100"};
  String amount = amounts[(int)random(0,amounts.length)];
  
  public Effect()
  {
    chip = loadShape("pokerchip.obj");
    chip.scale(20);
    chip.disableStyle();
    
    int random = (int)random(0,2);
    if(random == 0)
    {
      x = 0;
      xMover = random(1,5);
    }
    else
    {
      x = width;
      xMover = random(-5,-1);
    }
      
    y = height * 1.25;
    yMover = random(-7,-3);
    
    r = random(0,255);
    g = random(0,255);
    b = random(0,255);
    rotX = random(-.15,.15);
    rotZ = random(-.15,.15);
  }
  
  void render()
  {
    fill(r,b,g);
    noStroke();
    pushMatrix();
    translate(x,y,-100);
    rotateX(frameCount * rotX);
    rotateZ(frameCount * rotZ);
    shape(chip);
    pushMatrix();
    rotateX(PI/2);
    noFill();
    stroke(0);
    strokeWeight(2);
    circle(0,0,30);
    textSize(20);
    fill(0);
    text(amount,0,0);
    translate(0,0,-4);
    noFill();
    circle(0,0,30);
    fill(0);
    text(amount,0,0);
    popMatrix();
    popMatrix();
    
    x += xMover;
    y += yMover;
    yMover += .05;
  }
  
  boolean checkBounds()
  {
    if(y > height * 1.25 || x > width * 1.25 || x < -width * .25)
      return true;
    
    return false;
  }
}
