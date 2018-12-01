// pendulum
//
// Kuyuri Iroha
// 2018


PGraphics render;
PShader blurShader;
final int END_FRAME = 200;

Ball ball;

void setup()
{
  size(500, 500, P3D);
  frameRate(50);
  render = createGraphics(width, height, P3D);
  blurShader = loadShader("blur.glsl");
  smooth(16);
  
  ball = new Ball(new PVector(0.0, 170.0, 0.0), 15);
}

void draw()
{
  clear();
  for(int i=0; i<10; i++)
  {
    float t = float(frameCount%END_FRAME)/END_FRAME + float(i)/(1500); // 0.0 ~ 1.0
    
    ball.update(t);
    
    render.beginDraw();
    render.clear();
    
    render.pushMatrix();
    render.translate(width/2, height/2, 0.0);
    ball.draw(render);
    render.popMatrix();
    render.endDraw();
    
    blurShader.set("rendered", render);
    blurShader.set("m", cos(PI/2*i/10)*0.2);
    filter(blurShader);
  }
  /*
  saveFrame("capture/####.png");
  if(frameCount == END_FRAME)
  {
    exit();
  }
  */
}
