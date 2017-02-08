class Particle
{
  PVector center;
  float radius;
  float angle;
  float direction;
  PVector[] history;
  float color_value;
  color bodyColor;
  int len;
  float alpha_span;
  
  Particle(PVector ce, float r, float a, float c, float d)
  {
    center = ce.copy();
    radius = r;
    angle = a;
    direction = d;
    len = 12;
    alpha_span = 360 / len;
    color_value = c;
    bodyColor = color(color_value, 255, 255);
    
    history = new PVector[len];
    for(int i = 0; i < history.length; i++)
    {
      history[i] = new PVector(-width, -height, 0);
    }
  }
  
  void update()
  {
    float tmp_r = radius;// + map(noise(noise_value), 0, 1, -150, 150);
    float x = tmp_r * cos(radians(angle));
    float y = tmp_r * sin(radians(angle));
    float z = random(-30, 30);
    
    for(int i = history.length - 1; i > 0; i--)
    {
      history[i] = history[i - 1].copy();
    }
    history[0] = new PVector(x, y, z);
    
    angle += direction;
    radius += 1;
  }
  
  void display()
  {    
    for(int i = history.length - 1; i > 0; i--)
    {
      pushMatrix();
      translate(history[i].x, history[i].y, history[i].z);
      
      noStroke();
      fill(bodyColor, 255 - i * alpha_span);
      sphere(5);
       
      popMatrix();    
    }
  }
  
  boolean isDead()
  {   
    return false;
  }
}