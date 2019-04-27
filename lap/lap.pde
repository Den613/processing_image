PrintWriter textFile1;
PrintWriter textFile2;
PrintWriter textFile3;
float load1 [];
float load2 [];
float load3 [];
PImage img0;
PImage img1;
PImage img2;
PImage img3;


void setup()
{
  size(1200,600);
  img1 = loadImage("Alana.jpg");
  img0 = loadImage("Alana.jpg");
  img2 = createImage(img0.width, img0.height,RGB);
  img3 = createImage(img1.width, img1.height,RGB);
  textFile1 = createWriter("files/test1.txt");
  textFile2 = createWriter("files/test2.txt");
  textFile3 = createWriter("files/test3.txt");
}

void  laplas(float r[],float g[], float b[]){
  img3.loadPixels();
  int N,M;
  int n = img1.width;
  int m = img1.height;
  N = 3;
  M = 3;
  
//float[][] R = {{-1, 2, -1},{-2, 12, -2},{-1, -2, -1}};
float[][] R = {{0, -1,0},{-1,4,-1},{0,-1,0}};
//float[][] R = {{1,1,1},{1,-2,1},{-1,-1,-1}};
//float[][] R = {{-1,1,1},{-1,-2,1},{-1,1,1}};
//float[][] R = {{1,1,1},{-1,-2,1},{-1,-1,1}};
  float a1[][] = new float[n][m];
  float a2[][] = new float[n][m];
  float a3[][] = new float[n][m];
  for(int i = 0; i < n; i++){
    for(int j = 0; j < m; j++){
      a1[i][j] = r[j+i*m]; 
      a2[i][j] = g[j+i*m];
      a3[i][j] = b[j+i*m];      
    }
  }
  int e;
  e = Math.round(M/2);
  float window;
  float window1;
  float window2;
  for(int i = e; i < n - e; i++){
    for(int j = e; j < m - e; j++){
      for(int w = 0; w < N; w++){
        for(int h = 0; h < M; h++){
          window  = a1[i+w-e][j+h-e]*R[w][h];
          window1 = a2[i+w-e][j+h-e]*R[w][h];
          window2 = a3[i+w-e][j+h-e]*R[w][h];
          textFile1.println(window);
          textFile2.println(window1);
          textFile3.println(window2);
        }
      }
    }
  }
      textFile1.flush(); 
      textFile1.close();
      
      textFile2.flush(); 
      textFile2.close();
         
      textFile3.flush(); 
      textFile3.close();
 load1 = float(loadStrings("files/test1.txt"));
 load2 = float(loadStrings("files/test2.txt"));
 load3 = float(loadStrings("files/test3.txt"));
  int n1,m1;
  n1 = n - 2;
  m1 = m - 2;
  float A1[][] = new float[n1*m1][N*M];
  float A2[][] = new float[n1*m1][N*M];
  float A3[][] = new float[n1*m1][N*M];
  println("n = "+n+" m = "+m+" n1 = "+n1+" m1 = "+m1);
  for(int j = 0; j < n1*m1; j++){
    for(int i = 0; i < N*M; i++){
      A1[j][i]  = load1[i+j*N*M];
      A2[j][i]  = load2[i+j*N*M];
      A3[j][i]  = load3[i+j*N*M];
    }
  }
  float tmp1;
  for(int k = 0; k < n1*m1; k++){
    for(int i = N*M-1; i>=0; i--){
      for(int j = 0; j < i; j++){
        if(A1[k][j] < A1[k][j+1])
        {
          tmp1 = A1[k][j];
          A1[k][j] = A1[k][j+1];
          A1[k][j+1] = tmp1;
        }
      }
    }
  }
  float tmp2;
  for(int k = 0; k < n1*m1; k++){
    for(int i = N*M-1; i>=0; i--){
      for(int j = 0; j < i; j++){
        if(A2[k][j] < A2[k][j+1])
        {
          tmp2 = A2[k][j];
          A2[k][j] = A2[k][j+1];
          A2[k][j+1] = tmp2;
        }
      }
    }
  }
  float tmp3;
  for(int k = 0; k < n1*m1; k++){
    for(int i = N*M-1; i>=0; i--){
      for(int j = 0; j < i; j++){
        if(A3[k][j] < A3[k][j+1])
        {
          tmp3 = A3[k][j];
          A3[k][j] = A3[k][j+1];
          A3[k][j+1] = tmp3;
        }
      }
    }
  }
  float c1[][] = new float[n1][m1];
  float c2[][] = new float[n1][m1];
  float c3[][] = new float[n1][m1];
  float sum1[] = new float[n*m];
  float sum2[] = new float[n*m];
  float sum3[] = new float[n*m];
  for(int i = 0; i < n*m; i++){
  sum1[i] = 0;
  sum2[i] = 0;
  sum3[i] = 0;
  }
  for(int j = 0; j < n1*m1; j++){
    for(int i = 0; i < N*M; i++){
      sum1[j] = sum1[j] + A1[j][i];
      sum2[j] = sum2[j] + A2[j][i];
      sum3[j] = sum3[j] + A3[j][i];
    }
  }
      for(int i = 0; i < n1; i++){
        for(int j = 0; j < m1; j++){
          c1[i][j] = Math.round(Math.abs(sum1[j+i*m1]));
          c2[i][j] = Math.round(Math.abs(sum2[j+i*m1]));
          c3[i][j] = Math.round(Math.abs(sum3[j+i*m1]));
        }
      }
      for(int i = 0; i < 1; i++){
        for(int j = 0; j < 20; j++){
          println(c1[i][j]+"||");
        }
      }
 for(int i = 1; i < n - 1; i++){
   for(int j = 1; j < m - 1; j++){
     a1[i][j] = c1[i - 1][j - 1];
     a2[i][j] = c2[i - 1][j - 1];
     a3[i][j] = c3[i - 1][j - 1];
   }
 }
 float out1[] = new float[n*m];
 float out2[] = new float[n*m];
 float out3[] = new float[n*m];
 for(int i = 0; i < n; i++){
   for(int j = 0; j < m; j++){
     out1[j+i*m] = a1[i][j];
     out2[j+i*m] = a2[i][j];
     out3[j+i*m] = a3[i][j];   
   }
 }
 for(int i = 0; i < n*m; i++)
 img3.pixels[i] = color(out1[i],out2[i],out3[i]);
 img3.updatePixels();
 image(img3,0,0,600,600);
 img3.save("sin_1.jpg");
}

void draw()
{
  img0.loadPixels();
  img1.loadPixels();
  
  int yy = img1.height;
  int xx = img1.width;
  float r[] = new float[xx*yy];
  float g[] = new float[xx*yy];
  float b[] = new float[xx*yy];
  for(int y = 0; y < img1.height; y++){
    for(int x = 0; x < img1.width; x++){
       int loc = x + y*img1.width;
       r[loc] = red(img1.pixels[loc]);
       g[loc] = green(img1.pixels[loc]);
       b[loc] = blue(img1.pixels[loc]);   
      // img2.pixels[loc] = color(r[loc],g[loc],b[loc]);     
  }
}
for(int y = 0; y < img0.height; y++){
    for(int x = 0; x < img0.width; x++){
       int loc = x + y*img0.width;
       float r1 = red(img0.pixels[loc]);
       float g1 = green(img0.pixels[loc]);
       float b1 = blue(img0.pixels[loc]);   
       img2.pixels[loc] = color(r1,g1,b1);     
  }
}
  laplas(r,g,b); 
  img2.updatePixels();
  image(img2,600,0,600,600);
  //img2.save("image_.jpg");
}