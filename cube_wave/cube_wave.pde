float angle = 0;
int w = 48;
float ma;
float maxD;
int wid;
int hei;
int g = 1;

void setup()
{
  size(400,400,P3D);
  ma = atan(1/sqrt(2));
  maxD = dist(0,0,200,200);
  wid = (int)width/2;
  hei = (int)height/2;
}

void draw()
{
  background(0);
  //camera angle
  ortho(400,-800,400,-400,-1000,1000);
  rotateX(QUARTER_PI);
  rotateY(ma);
  
  //grid of boxes
  for(int z = 0; z < height; z += w)
  {
    for(int x = 0; x < width; x+= w)
    {
      push();
      fill(255,0,255);
      float d =  dist(x,z,wid,hei);
      float offset = map(d, 0,maxD,-2,2);
      float a = angle + offset;
      //wave effect
      float h = map(sin(a),-1,1,0,300);
      translate(x-wid,hei,z-hei);
      box(w,h,w-2);
      pop();
    }
  }
  angle += 0.1;
}
