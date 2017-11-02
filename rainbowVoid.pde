void setup()
{
  size(500, 500,P3D);
}

void draw()
{
  float tm = millis()/1000.f;
  background(0);
  float voidRadius = 100; 
  float lineCount = 100; 
  
  translate(width/2, height/2);
  for (int i = 0; i < lineCount; i++)
  {
    float pct = i*1.f/lineCount;
    pushMatrix();
    rotate(TWO_PI*pct);
    float wt = 6*(1+sin(-tm+3*pct*TWO_PI))/2;
    strokeWeight(wt);
    translate(voidRadius, 0);
    drawLine(100 + 55*noise(i/5.f+tm));
    popMatrix();
  }
}

void drawLine(float len)
{
  pushStyle();
  colorMode(HSB, 255);
  int segments = 100;
  noFill();
  beginShape();
  for (int i = 0; i < segments; i++)
  {
    float pct = i*1.f/segments;
    int color_ = color(255*pct, 255, 255);
    stroke(color_);
    vertex(len*pct, 0);
  }
  endShape();
  popStyle();
}

