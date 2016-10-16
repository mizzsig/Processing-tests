PImage[] src = new PImage[4];
PImage[] tmp = new PImage[4];
int x, y, wh;
int k = 0;

void setup(){
  size(400, 400);
  src[0] = loadImage("1.png");
  src[1] = loadImage("2.png");
  src[2] = loadImage("3.png");
  src[3] = loadImage("4.png");
  image(src[0], 0, 0);
  image(src[1], 200, 0);
  image(src[2], 0, 200);
  image(src[3], 200, 200);
}

void pattern1(){
    x = (int)random(200);
    y = (int)random(200);
    wh = (int)random(19) + 1;
}

void pattern2(){
    x = (int)random(5) * 40;
    y = (int)random(5) * 40;
    wh = 40;
}

void draw(){
  k = (k + 1) % 5;

  if(k == 0){
    //pattern1();
    pattern2();
    
    tmp[0] = get(x, y, wh, wh);
    tmp[1] = get(x+200, y, wh, wh);
    tmp[2] = get(x, y+200, wh, wh);
    tmp[3] = get(x+200, y+200, wh, wh);
    
    image(tmp[0], x+200, y);
    image(tmp[1], x+200, y+200);
    image(tmp[2], x, y);
    image(tmp[3], x, y+200);
  }
}

void keyPressed(){
  if(key == 'r'){
    image(src[0], 0, 0);
    image(src[1], 200, 0);
    image(src[2], 0, 200);
    image(src[3], 200, 200);
  }
}