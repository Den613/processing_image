PImage img1;
PImage img2;
PImage img3;
void setup()
{
  size(1200,600);
  img1 = loadImage("777.jpg");
  img2 = createImage(img1.width, img1.height,RGB);
  img3 = createImage(img1.width, img1.height,RGB);
}

void roberts(float r[],float g[], float b[]){
  int n = img1.width;
  int m = img1.height;
  
  float f1[][] = new float[n][m];
  float f2[][] = new float[n][m];
  float f3[][] = new float[n][m];
    
  float A1[][] = new float[n][m];
  float A2[][] = new float[n][m];
  float A3[][] = new float[n][m];
  
  float out1[] = new float[n*m];
  float out2[] = new float[n*m];
  float out3[] = new float[n*m];
  for(int i = 0; i < m; i++){
    for(int j = 0; j < n; j++){
      f1[i][j] = r[j+i*m]; 
      f2[i][j] = g[j+i*m];
      f3[i][j] = b[j+i*m];      
    }
  }
  for(int i = 0; i < m-1; i++){
    for(int j = 0; j < n-1; j++){
      A1[i][j] = Math.round(sqrt(pow((f1[i][j] - f1[i+1][j+1]),2) + pow((f1[i+1][j] - f1[i][j+1]),2)));
      A2[i][j] = Math.round(sqrt(pow((f2[i][j] - f2[i+1][j+1]),2) + pow((f2[i+1][j] - f2[i][j+1]),2)));
      A3[i][j] = Math.round(sqrt(pow((f3[i][j] - f3[i+1][j+1]),2) + pow((f3[i+1][j] - f3[i][j+1]),2)));
    }
  }
  for(int i = 0; i < m; i++){
    for(int j = 0; j < n; j++){
      out1[j+i*n] = A1[i][j];
      out2[j+i*n] = A2[i][j];
      out3[j+i*n] = A3[i][j];
    }
  }
  for(int i = 0; i < n*m; i++)
 img3.pixels[i] = color(out1[i],out2[i],out3[i]);
 img3.updatePixels();
 image(img3,0,0,600,600);
}

void sobel(float r[],float g[], float b[]){
  int n = img1.width;
  int m = img1.height;
  
  float f1[][] = new float[n][m];
  float f2[][] = new float[n][m];
  float f3[][] = new float[n][m];
    
  float A1[][] = new float[n][m];
  float A2[][] = new float[n][m];
  float A3[][] = new float[n][m];
  
  float out1[] = new float[n*m];
  float out2[] = new float[n*m];
  float out3[] = new float[n*m];
  for(int i = 0; i < m; i++){
    for(int j = 0; j < n; j++){
      f1[i][j] = r[j+i*m]; 
      f2[i][j] = g[j+i*m];
      f3[i][j] = b[j+i*m];      
    }
  }
  for(int i = 1; i < m-1; i++){
    for(int j = 1; j < n-1; j++){
      A1[i][j] = Math.round(sqrt(pow((f1[i-1][j-1]+2*f1[i][j-1]+f1[i+1][j-1]-f1[i-1][j+1]+2*f1[i][j+1]+f1[i+1][j+1]),2) - pow((f1[i+1][j-1]+2*f1[i+1][j]+f1[i+1][j+1]-f1[i-1][j-1]+2*f1[i][j+1]+f1[i+1][j+1]),2)));
      A2[i][j] = Math.round(sqrt(pow((f2[i-1][j-1]+2*f2[i][j-1]+f2[i+1][j-1]-f2[i-1][j+1]+2*f2[i][j+1]+f2[i+1][j+1]),2) - pow((f2[i+1][j-1]+2*f2[i+1][j]+f2[i+1][j+1]-f2[i-1][j-1]+2*f2[i][j+1]+f2[i+1][j+1]),2)));
      A3[i][j] = Math.round(sqrt(pow((f3[i-1][j-1]+2*f3[i][j-1]+f3[i+1][j-1]-f3[i-1][j+1]+2*f3[i][j+1]+f3[i+1][j+1]),2) - pow((f3[i+1][j-1]+2*f3[i+1][j]+f3[i+1][j+1]-f3[i-1][j-1]+2*f3[i][j+1]+f3[i+1][j+1]),2)));
    }
  }
  for(int i = 0; i < m; i++){
    for(int j = 0; j < n; j++){
      out1[j+i*n] = A1[i][j];
      out2[j+i*n] = A2[i][j];
      out3[j+i*n] = A3[i][j];
    }
  }
  for(int i = 0; i < n*m; i++)
 img3.pixels[i] = color(out1[i],out2[i],out3[i]);
 img3.updatePixels();
 image(img3,0,0,600,600);
}

void previtta(float r[],float g[], float b[]){
  int n = img1.width;
  int m = img1.height;
  
  float f1[][] = new float[n][m];
  float f2[][] = new float[n][m];
  float f3[][] = new float[n][m];
    
  float A1[][] = new float[n][m];
  float A2[][] = new float[n][m];
  float A3[][] = new float[n][m];
  
  float out1[] = new float[n*m];
  float out2[] = new float[n*m];
  float out3[] = new float[n*m];
  for(int i = 0; i < m; i++){
    for(int j = 0; j < n; j++){
      f1[i][j] = r[j+i*m]; 
      f2[i][j] = g[j+i*m];
      f3[i][j] = b[j+i*m];      
    }
  }
  for(int i = 1; i < m-1; i++){
    for(int j = 1; j < n-1; j++){
      A1[i][j] = Math.round(sqrt(pow((f1[i-1][j-1]+f1[i][j-1]+f1[i+1][j-1]-f1[i-1][j+1]+f1[i][j+1]+f1[i+1][j+1]),2) + pow((f1[i+1][j-1])+f1[i+1][j]+f1[i+1][j+1]-f1[i-1][j-1]+f1[i-1][j]+f1[i-1][j+1],2)));
      A2[i][j] = Math.round(sqrt(pow((f2[i-1][j-1]+f2[i][j-1]+f2[i+1][j-1]-f2[i-1][j+1]+f2[i][j+1]+f2[i+1][j+1]),2) + pow((f2[i+1][j-1])+f2[i+1][j]+f2[i+1][j+1]-f2[i-1][j-1]+f2[i-1][j]+f2[i-1][j+1],2)));
      A3[i][j] = Math.round(sqrt(pow((f3[i-1][j-1]+f3[i][j-1]+f3[i+1][j-1]-f3[i-1][j+1]+f3[i][j+1]+f3[i+1][j+1]),2) + pow((f3[i+1][j-1])+f3[i+1][j]+f3[i+1][j+1]-f3[i-1][j-1]+f3[i-1][j]+f3[i-1][j+1],2))); 
  }
  }
  for(int i = 0; i < m; i++){
    for(int j = 0; j < n; j++){
      out1[j+i*n] = A1[i][j];
      out2[j+i*n] = A2[i][j];
      out3[j+i*n] = A3[i][j];
    }
  }
  for(int i = 0; i < n*m; i++)
 img3.pixels[i] = color(out1[i],out2[i],out3[i]);
 img3.updatePixels();
 image(img3,0,0,600,600);
// img3.save("sin_1.jpg");
}

void stat_method(float r[],float g[], float b[]){
  int n = img1.width;
  int m = img1.height;
  
  float f1[][] = new float[n][m];
  float f2[][] = new float[n][m];
  float f3[][] = new float[n][m];

  float out1[] = new float[n*m];
  float out2[] = new float[n*m];
  float out3[] = new float[n*m];
  for(int i = 0; i < m; i++){
    for(int j = 0; j < n; j++){
      f1[i][j] = r[j+i*m]; 
      f2[i][j] = g[j+i*m];
      f3[i][j] = b[j+i*m];      
    }
  }
  
 float sum1 = 0;
 float sum2 = 0;
 float sum3 = 0;
 
  for(int i = 0; i < m; i++){
    for(int j = 0; j < n; j++){
  sum1 = sum1 +  f1[i][j]; 
  sum2 = sum2 +  f2[i][j];
  sum3 = sum3 +  f3[i][j];      
    }
  }
  
 float mu_r;
 float mu_g;
 float mu_b;
 mu_r = sum1/(n*m);
 mu_g = sum2/(n*m);
 mu_b = sum3/(n*m);
 float sum_r = 0;
 float sum_g = 0;
 float sum_b = 0;
  for(int i = 0; i < m; i++){
    for(int j = 0; j < n; j++){
  sum_r = sum_r +  pow((abs(f1[i][j]-mu_r)),2);
  sum_g = sum_g +  pow((abs(f2[i][j]-mu_g)),2);
  sum_b = sum_b +  pow((abs(f3[i][j]-mu_b)),2);      
    }
  }

float q_r;
float q_g;
float q_b;
q_r = round(sqrt(sum_r/(m*n)));
q_g = round(sqrt(sum_g/(m*n)));
q_b = round(sqrt(sum_b/(m*n)));

float A1[][] = new float[n][m];
float A2[][] = new float[n][m];
float A3[][] = new float[n][m];
  
for(int i = 0; i < m; i++){
    for(int j = 0; j < n; j++){
  A1[i][j] = q_r*f1[i][j]*0.2;
  A2[i][j] = q_g*f2[i][j]*0.2;
  A3[i][j] = q_b*f3[i][j]*0.2;
    }
  }
  
  
  for(int i = 0; i < m; i++){
    for(int j = 0; j < n; j++){
      out1[j+i*n] = A1[i][j];
      out2[j+i*n] = A2[i][j];
      out3[j+i*n] = A3[i][j];
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
       img2.pixels[loc] = color(r[loc],g[loc],b[loc]);     
  }
}

//roberts(r,g,b);
//sobel(r,g,b);
//previtta(r,g,b);
stat_method(r,g,b);
  img2.updatePixels();
  image(img2,600,0,600,600);
}