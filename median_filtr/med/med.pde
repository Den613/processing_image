PrintWriter textFile1;
PrintWriter textFile2;
PrintWriter textFile3;
float load1 [];
float load2 [];
float load3 [];
PImage img1;
PImage img2;
PImage img3;


void setup()
{
  size(1200,600);
  img1 = loadImage("image020.jpg");
  img2 = createImage(img1.width, img1.height,RGB);
  img3 = createImage(img1.width, img1.height,RGB);
  textFile1 = createWriter("files/test1.txt");
  textFile2 = createWriter("files/test2.txt");
  textFile3 = createWriter("files/test3.txt");

}

void  median_filter(float r[],float g[], float b[]){
  img3.loadPixels();
  int N,M;
  int n = img1.width;
  int m = img1.height;
  N = 3;
  M = 3;
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
          window  = a1[i+w-e][j+h-e];
          window1 = a2[i+w-e][j+h-e];
          window2 = a3[i+w-e][j+h-e];
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
        if(A1[k][j] > A1[k][j+1])
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
        if(A2[k][j] > A2[k][j+1])
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
        if(A3[k][j] > A3[k][j+1])
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
      for(int i = 0; i < n1; i++){
        for(int j = 0; j < m1; j++){
          c1[i][j] = A1[j+i*m1][4];
          c2[i][j] = A2[j+i*m1][4];
          c3[i][j] = A3[j+i*m1][4];
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
}

void draw()
{
  img1.loadPixels();
  //img2.loadPixels();
  //img3.loadPixels();
  int yy = img1.height;
  int xx = img1.width;
  float r[] = new float[xx*yy];
  float g[] = new float[xx*yy];
  float b[] = new float[xx*yy];
 // println(yy+" " +xx);
  for(int y = 0; y < img1.height; y++){
    for(int x = 0; x < img1.width; x++){
      int loc = x + y*img1.width;
       r[loc] = red(img1.pixels[loc]);
       g[loc] = green(img1.pixels[loc]);
       b[loc] = blue(img1.pixels[loc]);
    
 img2.pixels[loc] = color(r[loc],g[loc],b[loc]);     
     //textFile.println(r[loc]);
  }}
  
  median_filter(r,g,b); 
 
 //     textFile.flush(); 
   //   textFile.close(); 
  
  img2.updatePixels();
 // img3.updatePixels();
  image(img2,600,0,600,600);
  //image(img3,0,0,400,600);
}