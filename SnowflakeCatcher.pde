Snowflake [] snow;

void setup()
{
  background(0);
  size(500, 500); 
  snow = new Snowflake[500];
  for(int i = 0; i < snow.length; i++)
  {
    snow[i] = new Snowflake();
  }
  frameRate(15);
}

void draw()
{
  for (int i = 0; i < snow.length; i++)
  {
    snow[i].erase();
    snow[i].lookDown();
    snow[i].move();
    snow[i].wrap();
    snow[i].show();
  }
}
void mouseDragged()
{
  noStroke();
  fill(80);
  ellipse(mouseX, mouseY, 10, 10);
}

class Snowflake
{
  int x, y;
  boolean isMoving;
  Snowflake()
  {
    x = (int)(Math.random()*501);
    y = (int)(Math.random()*501);
    isMoving = true;
  }

  void show()
  {
    stroke(0);
    fill(50, 205, 50);
    rect(x, y, 12, 7);
  }

  void lookDown()
  {
    //your code here
    if (0 < y && y < 500)
    {
      if (get(x, y+10) != color(0))
      {
        isMoving = false;
      }
      else
      {
        isMoving = true;
      }
    }
  }

  void erase()
  {
    //your code here
    fill(0);
    rect(x, y, 7, 7);
  }

  void move()
  {
    //your code here
    if (isMoving == true)
    {
      y+=1;
    }
  }

  void wrap()
  {
    if (y > 490)
    {
      y = 0;
      x = (int)(Math.random()*501);
    }
  }
}


