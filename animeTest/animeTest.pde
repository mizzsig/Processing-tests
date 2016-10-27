import gifAnimation.*;
int i = 0;
int t = 0;
PImage normal[] = new PImage[4];
PImage close[] = new PImage[4];
PImage end[] = new PImage[8];
PFont font;
mozi m1[] = new mozi[13];
mozi m2[] = new mozi[16];
mozi m3[] = new mozi[13];
mozi m4[] = new mozi[10];
mozi m5[] = new mozi[16];
String l1 = "最近は食パンを食べるときに";
String l2 = "はちみつ入りシロップを塗ってます";
String l3 = "はちみつよりもクセがなくて";
String l4 = "食べやすいんですけど";
String l5 = "はちみつの方が甘いから好きだなぁ";
int r = 3;
GifMaker gifExport;

class mozi{
  int x, y;
  String s;
  int rad;
  
  mozi(int _x, int _y, String _s){
    x = _x;
    y = _y;
    s = _s;
    rad = 0;
  }
  
  void update(){
    rad = (rad + 4) % 360;
    fill(255);
    textFont(font, 27 - abs((rad / 36) - 5));
    text(s, x + r * cos(rad * (float)Math.PI / 180.0), y + r * sin(rad * (float)Math.PI / 180.0));
  }
}

void setup(){
  size(400, 600);
  normal[0] = loadImage("1.png");
  normal[1] = loadImage("2.png");
  normal[2] = loadImage("3.png");
  normal[3] = loadImage("4.png");
  close[0] = loadImage("c1.png");
  close[1] = loadImage("c2.png");
  close[2] = loadImage("c3.png");
  close[3] = loadImage("c4.png");
  end[0] = loadImage("e1.png");
  end[1] = loadImage("e2.png");
  end[2] = loadImage("e3.png");
  end[3] = loadImage("e4.png");
  end[4] = loadImage("e5.png");
  end[5] = loadImage("e6.png");
  end[6] = loadImage("e7.png");
  end[7] = loadImage("e8.png");
  background(255);
  font = loadFont("mikachan-48.vlw");
  
  for(int i = 0; i < 13; i++){
    m1[i] = new mozi(5 + 24 * i, 430, l1.substring(i, i+1));
  }
  for(int i = 0; i < 16; i++){
    m2[i] = new mozi(5 + 24 * i, 460, l2.substring(i, i+1));
  }
  for(int i = 0; i < 13; i++){
    m3[i] = new mozi(5 + 24 * i, 510, l3.substring(i, i+1));
  }
  for(int i = 0; i < 10; i++){
    m4[i] = new mozi(5 + 24 * i, 540, l4.substring(i, i+1));
  }
  for(int i = 0; i < 16; i++){
    m5[i] = new mozi(5 + 24 * i, 590, l5.substring(i, i+1));
  }
  
  frameRate(50);
  gifExport = new GifMaker(this, "result.gif");
  gifExport.setRepeat(0);
  gifExport.setQuality(9);
  gifExport.setDelay(20);
}

void draw(){
  t++;
  fill(255);
  rect(-1, -1, 401, 401);
  if(((t > 196 && t < 220) || (t > 380 && t < 420)) && (t < 580)){
    image(close[i / 4], 0, 0);
  }else if(t < 580){
    if((t % 20 > 0) && (t % 20 < 10) && (t < 500)){
      image(normal[i / 4], 0, 0);
    }else{
      image(close[i / 4], 0, 0);
    }
  }else if(t < 590){
    image(end[(t - 580) / 2], 0, 0);
  }else{
    image(end[(t % 12) / 4 + 5], 0, 0);
  }
  i = (i + 1) % 16;
  fill(180);
  rect(-1, 400, 401, 200);
  fill(255);
  for(int i = 0; i < 13; i++){
    if(t > i * 6){
      m1[i].update();
    }
  }
  for(int i = 0; i < 16; i++){
    if(t > i * 6 + 100){ // 196
      m2[i].update();
    }
  }
  for(int i = 0; i < 13; i++){
    if(t > i * 6 + 220){
      m3[i].update();
    }
  }
  for(int i = 0; i < 10; i++){
    if(t > i * 6 + 320){ // 380
      m4[i].update();
    }
  }
  for(int i = 0; i < 16; i++){
    if(t > i * 6 + 420){
      m5[i].update();
    }
  }
  if(t < 750){
    gifExport.addFrame();
  }else{
    gifExport.finish();
    exit();
  }
}