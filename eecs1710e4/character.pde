
   
class LetterGenerator {
  
    PShape a,a1,a2,a3,a4,b,b1,b2,b3,b4,b5,b6,c,c1,c2,c3,c4,c5,d,d1,d2,d3,d4,e,e1,e2,e3,e4,f,f1,f2,f3,g,g1,g2,g3,g4,g5,g6,h,ii,j,k,l,m,n,o,p,q,r,s,t,u,v,w,z;
  ArrayList<Letter> letters;
  PVector position;
  float offset = 150;
  
  LetterGenerator(String input, float x, float y) {
    initShapes();
    position = new PVector(x, y);
    letters = new ArrayList<Letter>();
    
    for (int i=0; i<input.length(); i++) {     
      char ch = input.charAt(i);
      
      float px = position.x + ((i+1) * offset);
      float py = position.y;
      
      switch(ch) {
        case 'a':
          letters.add(new Letter(a, px, py));
          break;
        case 'b':
          letters.add(new Letter(b, px, py));
          break;
        case 'c':
          letters.add(new Letter(c, px, py));
          break;
        case 'd':
          letters.add(new Letter(d, px, py));
          break;
         case 'e':
          letters.add(new Letter(e, px, py));
          break;
        case 'f':
          letters.add(new Letter(f, px, py));
          break;
           case 'g':
          letters.add(new Letter(g, px, py));
          break;
           case 'h':
          letters.add(new Letter(h, px, py));
          break;
          case 'i':
          letters.add(new Letter(ii, px, py));
          break;
           case 'j':
          letters.add(new Letter(j, px, py));
          break;
         case 'k':
          letters.add(new Letter(k, px, py));
          break;
           case 'l':
          letters.add(new Letter(l, px, py));
          break;
         case 'm':
          letters.add(new Letter(m, px, py));
          break;
          case 'n':
          letters.add(new Letter(n, px, py));
          break;
          case 'o':
          letters.add(new Letter(o, px, py));
          break;
          case 'p':
          letters.add(new Letter(p, px, py));
          break;
          case 'q':
          letters.add(new Letter(q, px, py));
          break;
          case 'r':
          letters.add(new Letter(r, px, py));
          break;
          case 's':
          letters.add(new Letter(s, px, py));
          break;
          case 't':
          letters.add(new Letter(t, px, py));
          break;
          case 'u':
          letters.add(new Letter(u, px, py));
          break;
          case 'v':
          letters.add(new Letter(v, px, py));
          break;
          case 'w':
          letters.add(new Letter(w, px, py));
          break;
          case 'z':
          letters.add(new Letter(z, px, py));
          break;
    }
    }
  }

  void initShapes() {
    a= createShape(GROUP);
    a.setFill(color(250));
    a1 = createShape(RECT,50,0,50,50);
    a1.setFill(color(250));
    a2 = createShape(RECT,0,50,50,200);
    a2.setFill(color(250));
    a3 = createShape(RECT,100,50,50,200);
    a3.setFill(color(250));
    a4 = createShape(RECT,50,150,50,50);
    a4.setFill(color(250));
    a.addChild(a1);
    a.addChild(a2);
    a.addChild(a3);
    a.addChild(a4);
    
    b= createShape(GROUP);
    b.setFill(color(250));
    b1 = createShape(RECT,0,0,50,250);
    b1.setFill(color(250));
    b2 = createShape(RECT,50,0,50,50);
    b2.setFill(color(250));
    b3 = createShape(RECT,100,50,50,50);
    b3.setFill(color(250));
    b4 = createShape(RECT,50,100,50,50);
    b4.setFill(color(250));
    b5 = createShape(RECT,100,150,50,50);
    b5.setFill(color(250));
    b6 = createShape(RECT,50,200,50,50);
    b6.setFill(color(250));
    b.addChild(b1);
    b.addChild(b2);
    b.addChild(b3);
    b.addChild(b4);
    b.addChild(b5);
    b.addChild(b6);
    
    c= createShape(GROUP);
    c.setFill(color(250));
    c1 = createShape(RECT,0,50,50,150);
    c1.setFill(color(250));
    c2 = createShape(RECT,50,0,50,50);
    c2.setFill(color(250));
    c3 = createShape(RECT,100,50,50,50);
    c3.setFill(color(250));
    c4 = createShape(RECT,50,200,50,50);
    c4.setFill(color(250));
    c5 = createShape(RECT,100,150,50,50);
    c5.setFill(color(250));
    c.addChild(c1);
    c.addChild(c2);
    c.addChild(c3);
    c.addChild(c4);
    c.addChild(c5);
    
    d= createShape(GROUP);
    d.setFill(color(250));
    d1 = createShape(RECT,0,0,50,250);
    d1.setFill(color(250));
    d2 = createShape(RECT,50,0,50,50);
    d2.setFill(color(250));
    d3 = createShape(RECT,100,50,50,150);
    d3.setFill(color(250));
    d4 = createShape(RECT,50,200,50,50);
    d4.setFill(color(250));
    d.addChild(d1);
    d.addChild(d2);
    d.addChild(d3);
    d.addChild(d4);
    
    e= createShape(GROUP);
    e.setFill(color(250));
    e1 = createShape(RECT,0,0,50,250);
    e1.setFill(color(250));
    e2 = createShape(RECT,50,0,100,50);
    e2.setFill(color(250));
    e3 = createShape(RECT,50,100,50,50);
    e3.setFill(color(250));
    e4 = createShape(RECT,50,200,100,50);
    e4.setFill(color(250));
    e.addChild(e1);
    e.addChild(e2);
    e.addChild(e3);
    e.addChild(e4);
    
    f= createShape(GROUP);
    f.setFill(color(250));
    f1 = createShape(RECT,0,0,50,250);
    f1.setFill(color(250));
    f2 = createShape(RECT,50,0,50,100);
    f2.setFill(color(250));
    f3 = createShape(RECT,50,100,50,50);
    f3.setFill(color(250));
    f.addChild(f1);
    f.addChild(f2);
    f.addChild(f3);

    g= createShape(GROUP);
    g.setFill(color(250));
    g1 = createShape(RECT,0,50,50,150);
    g1.setFill(color(250));
    g2 = createShape(RECT,50,0,50,50);
    g2.setFill(color(250));
    g3 = createShape(RECT,100,50,50,50);
    g3.setFill(color(250));
    g4 = createShape(RECT,50,200,50,50);
    g4.setFill(color(250));
    g5 = createShape(RECT,100,150,50,50);
    g5.setFill(color(250));
    g6 = createShape(RECT,50,125,50,25);
    g6.setFill(color(250));
    g.addChild(g1);
    g.addChild(g2);
    g.addChild(g3);
    g.addChild(g4);
    g.addChild(g5);
    g.addChild(g6);


  }
  
  void update() {
    //
  }
  
  void draw() {
    for (Letter letter : letters) {
      letter.run();
    }
  }
  
  void run() {
    update();
    draw();
  }

}
