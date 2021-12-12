import gab.opencv.*;
import processing.video.*;
import java.awt.*;
Capture video;
OpenCV opencv;

// List of my Face objects (persistent)
ArrayList<Face> faceList;
// List of detected faces (every frame)
Rectangle[] faces;

// Number of faces detected over all time. Used to set IDs.
int faceCount = 0;

// Scaling down the video
int scl = 2;
PImage[] p;

import ddf.minim.*;//导入mini库，这个库用来播放音乐
Minim minim;
AudioPlayer player;//播放器
AudioPlayer player2;
void setup() {
  size(640, 480);
  video = new Capture(this, width/scl, height/scl);
  opencv = new OpenCV(this, width/scl, height/scl);
  opencv.loadCascade(OpenCV.CASCADE_FRONTALFACE);  

  faceList = new ArrayList<Face>();

  video.start();
  p = new PImage[118];
  for (int i = 0; i<7; i++)
  {
    p[i]=loadImage("1 ("+(i+1)+").png");
  }
  imageMode(CENTER);
  minim = new Minim(this);
  player = minim.loadFile("1.mp3");
  player2 = minim.loadFile("2.mp3");
  player2.loop();
}

void draw() {
  scale(scl);
  opencv.loadImage(video);

  image(video, width/4, height/4 );

  detectFaces();

  for (Face f : faceList) {
    strokeWeight(2);
    f.display();
  }
}

void detectFaces() {

  // Faces detected in this frame
  faces = opencv.detect();

  // Check if the detected faces already exist are new or some has disappeared. 

  // SCENARIO 1 
  // faceList is empty
  if (faceList.isEmpty()) {
    // Just make a Face object for every face Rectangle
    for (int i = 0; i < faces.length; i++) {
      println("+++ New face detected with ID: " + faceCount);
      faceList.add(new Face(faceCount, faces[i].x, faces[i].y, faces[i].width, faces[i].height));
      faceCount++;
      if (faceCount>6)
        faceCount =0;
      player.rewind();
      player.play();
    }

    // SCENARIO 2 
    // We have fewer Face objects than face Rectangles found from OPENCV
  } else if (faceList.size() <= faces.length) {
    boolean[] used = new boolean[faces.length];
    // Match existing Face objects with a Rectangle
    for (Face f : faceList) {
      // Find faces[index] that is closest to face f
      // set used[index] to true so that it can't be used twice
      float record = 50000;
      int index = -1;
      for (int i = 0; i < faces.length; i++) {
        float d = dist(faces[i].x, faces[i].y, f.r.x, f.r.y);
        if (d < record && !used[i]) {
          record = d;
          index = i;
        }
      }
      // Update Face object location
      used[index] = true;
      f.update(faces[index]);
    }
    // Add any unused faces
    for (int i = 0; i < faces.length; i++) {
      if (!used[i]) {
        println("+++ New face detected with ID: " + faceCount);
        faceList.add(new Face(faceCount, faces[i].x, faces[i].y, faces[i].width, faces[i].height));
        faceCount++;
        if (faceCount>6)
          faceCount =0;
        player.rewind();
        player.play();
      }
    }

    // SCENARIO 3 
    // We have more Face objects than face Rectangles found
  } else {
    // All Face objects start out as available
    for (Face f : faceList) {
      f.available = true;
    } 
    // Match Rectangle with a Face object
    for (int i = 0; i < faces.length; i++) {
      // Find face object closest to faces[i] Rectangle
      // set available to false
      float record = 50000;
      int index = -1;
      for (int j = 0; j < faceList.size(); j++) {
        Face f = faceList.get(j);
        float d = dist(faces[i].x, faces[i].y, f.r.x, f.r.y);
        if (d < record && f.available) {
          record = d;
          index = j;
        }
      }
      // Update Face object location
      Face f = faceList.get(index);
      f.available = false;
      f.update(faces[i]);
    } 
    // Start to kill any left over Face objects
    for (Face f : faceList) {
      if (f.available) {
        f.countDown();
        if (f.dead()) {
          f.delete = true;
        }
      }
    }
  }

  // Delete any that should be deleted
  for (int i = faceList.size()-1; i >= 0; i--) {
    Face f = faceList.get(i);
    if (f.delete) {
      faceList.remove(i);
    }
  }
}

void captureEvent(Capture c) {
  c.read();
}

class Face {

  // A Rectangle
  Rectangle r;

  // Am I available to be matched?
  boolean available;

  // Should I be deleted?
  boolean delete;

  // How long should I live if I have disappeared?
  int timer = 15;

  // Assign a number to each face
  int id;

  // Make me
  Face(int newID, int x, int y, int w, int h) {
    r = new Rectangle(x, y, w, h);
    available = true;
    delete = false;
    id = newID;
  }

  // Show me
  void display() {
    if (faceCount>=0 && faceCount<7)
      image(p[faceCount], r.x+r.width/2, r.y+r.height/2, r.width*1.2, r.height*1.5);
  }

  // Give me a new location / size
  // Oooh, it would be nice to lerp here!
  void update(Rectangle newR) {
    r = (Rectangle) newR.clone();
  }

  // Count me down, I am gone
  void countDown() {
    timer--;
  }

  // I am deed, delete me
  boolean dead() {
    if (timer < 0) return true;
    return false;
  }
}
