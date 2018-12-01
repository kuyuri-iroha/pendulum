
// ボールクラス
class Ball
{
  PVector pos;
  PVector rot[];
  PVector offsetRot[];
  PVector initPos;
  float size;
  
  Ball(PVector _pos, float _size)
  {
    pos = _pos;
    initPos= pos.copy();
    rot = new PVector[4];
    for(int i=0; i<rot.length; i++)
    {
      rot[i] = new PVector();
    }
    offsetRot = new PVector[4];
    for(int i=0; i<rot.length; i++)
    {
      offsetRot[i] = new PVector(PI/random(-5.0, 5.0), PI/random(-5.0, 5.0), PI/random(-5.0, 5.0));
    }
    size = _size;
  }
  
  void update(float t)
  {
    int freq = 1;
    for(int i=0; i<rot.length; i++)
    {
      rot[i].x = sin(TAU * (freq*i+1) * t) * PI/4 + offsetRot[i].x;
      rot[i].y = sin(TAU * (freq*i+2) * t) * PI + offsetRot[i].x;
      rot[i].z = sin(TAU * (freq) * t) * PI/2 + offsetRot[i].x;
    }
  }
  
  void draw(PGraphics render)
  {
    render.pushMatrix();
    render.lightFalloff(0, 0.005, 0.0);
    final float ambient = 50;
    render.ambientLight(ambient, ambient, ambient);
    final float directional = 102;
    render.directionalLight(directional, directional, directional, 1.0, 1.0, -1.0);
    
    render.fill(#fafafa);
    render.noStroke();
    for(int i=0; i<rot.length; i++)
    {
      render.pushMatrix();
      render.rotateX(rot[i].x);
      render.rotateY(rot[i].y);
      render.rotateZ(rot[i].z);
      render.translate(pos.x, pos.y, pos.z);
      render.sphere(size);
      render.popMatrix();
    }
    render.popMatrix();
  }
}
