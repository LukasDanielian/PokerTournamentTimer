public class Timer
{
  int total;
  int minutes;
  int seconds;
  
  public Timer(int minutes)
  {
    this.total = minutes;
    this.minutes = minutes;
    seconds = 0;
  }
  
  public void update()
  {
    seconds--;
    
    if(seconds < 0)
    {
      seconds = 59;
      minutes--;
    }
      
    if(minutes < 0)
    {
      minutes = total;
      seconds = 0;
      sB = bB;
      bB = bB * 2;
      sound.play();
    }
  }
  
  public void render()
  {
    textSize(100);
    if(seconds > 9)
      text(minutes + ":" + seconds, width/2, height * .6);
    else
      text(minutes + ":0" + seconds, width/2, height * .6);
  }
}
