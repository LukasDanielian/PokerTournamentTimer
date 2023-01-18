public class Button
{
  private float x, y, w, h;
  private boolean coolDownReady;
  private int coolDownTimer;

  public Button()
  {
    x = width/2;
    y = height * .85;
    w = width / 3;
    h = height / 6;
    coolDownReady = true;
    coolDownTimer = 10;
  }

  public void render()
  {
    noFill();
    stroke(255);
    strokeWeight(5);
    rect(x, y, w, h, 30);

    if (!coolDownReady)
    {
      coolDownTimer--;

      if (coolDownTimer <= 0)
      {
        coolDownTimer = 10;
        coolDownReady = true;
      }
    }

    noStroke();
    fill(255);
    if (isRunning)
    {
      rect(x - w/10, y, w/10, h * .8);
      rect(x + w/10, y, w/10, h * .8);
    } else
    {
      triangle(x - w/7, y - h/2.5, x - w/7, y + h/2.5, x + w/5, y);
    }
  }

  public void isClicked()
  {
    if (mousePressed && mouseX > x - w/2 && mouseX < x + w/2 && mouseY > y - h/2 && mouseY < y + h/2 && coolDownReady)
    {
      isRunning = !isRunning;
      coolDownReady = false;
    }
  }
}
