PImage img;
PrintWriter output;

void setup() {
  int i, j;
  color c;
  float r, g, b;
  output = createWriter("pontosx10H.txt"); 
  size(1417, 2203);
  img = loadImage("28I-04-Cabeca-BP-Perfil.png");
  for (i = 0; i<=1417; i++){
    for (j = 0; j<=2203; j += 10) {
      c = img.get(i, j);
      r = red(c);
      g = green(c);
      b = blue(c);
      if (r == 0 && g == 0 && b == 0) {
        output.println(i+  "\t" + j + "\t" + "0"+ "\t"+ r+ "\t" + g + "\t" + b);
      }
    }
  }
  output.flush(); 
  output.close();
  exit();
}
