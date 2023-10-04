PImage img;
PrintWriter output;

void setup() {
  int i, j;
  color c;
  float r, g, b;
  output = createWriter("PeFrente.txt"); 
  size(1417, 2203);
  img = loadImage("DurerPeFrente.png");
  for (i = 0; i<1417; i++){
    for (j = 0; j<2203; j++) {
      c = img.get(i, j);
      r = red(c);
      g = green(c);
      b = blue(c);
      if (r == 0 && g == 0 && b == 0) {
        output.println(i +  "\t" + j + "\t" + "0"); //frente
        //output.println("0" +  "\t" + j + "\t" + i);//perfil
      }
    }
  }
  output.flush(); 
  output.close();
  exit();
}
