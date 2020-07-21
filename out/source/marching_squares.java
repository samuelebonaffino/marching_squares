import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class marching_squares extends PApplet {

Field field;

public void setup()
{
    
    field = new Field();
    field.generate();
}

public void draw()
{
    background(100);
    field.drawPoints();
    field.drawBounderies();
}
class Field
{
    final static int SIZE = 32;
    int rows, cols;
    int[][] vertex;

    Field()
    {
        rows = height/SIZE + 1;
        cols = width/SIZE + 1;
        vertex = new int[rows][cols];
    }

    public void generate()
    {
        for(int i = 0; i < rows; i++)
            for(int j = 0; j < rows; j++)
                vertex[i][j] = floor(random(2));
    }

    public void drawPoints()
    {
        noFill();
        strokeWeight(SIZE*0.5f);
        for(int i = 0; i < rows; i++)
            for(int j = 0; j < cols; j++)
            {
                int x = j * SIZE;
                int y = i * SIZE;
                stroke(vertex[i][j]*255);;
                point(x, y);
            }
    }

    public void drawBounderies()
    {
        stroke(255, 150, 0);
        strokeWeight(2);
        for(int i = 0; i < rows-1; i++)
            for(int j = 0; j < cols-1; j++)
            {
                PVector a = new PVector(i*SIZE + SIZE*0.5f, j*SIZE);
                PVector b = new PVector(i*SIZE + SIZE, j*SIZE + SIZE*0.5f);
                PVector c = new PVector(i*SIZE + SIZE*0.5f, j*SIZE + SIZE);
                PVector d = new PVector(i*SIZE, j*SIZE + SIZE*0.5f);
                switch(getDecimalState(i, j)) 
                {
                    case 1:
                        lineV(b, c);
                        break;
                    case 2:
                        lineV(c, d);
                        break;
                    case 3:
                        lineV(b, d);
                        break;
                    case 4:
                        lineV(a, b);
                        break;
                    case 5:
                        lineV(a, c);
                        break;
                    case 6:
                        lineV(a, b);
                        lineV(c, d);
                        break;
                    case 7:
                        lineV(a, d);
                        break;
                    case 8:
                        lineV(a, d);
                        break;
                    case 9:
                        lineV(a, d);
                        lineV(b, c);
                        break;
                    case 10:
                        lineV(a, c);
                        break;
                    case 11:
                        lineV(a, b);
                        break;
                    case 12:
                        lineV(b, d);
                        break;
                    case 13:
                        lineV(c, d);
                        break;
                    case 14:
                        lineV(b, c);
                        break;
                }
            }
    }
    
    public void lineV(PVector v1, PVector v2)
    {
        line(v1.x, v1.y, v2.x, v2.y);
    }
    // String getStateBinary(int i, int j)
    // {
    //     if(i < rows - 1 && j < cols - 1)
    //         return new String(vertex[i][j] + vertex[i][j+1] + vertex[i+1][j] + vertex[i+1][j+1]);
    //     return "-";
    // }

    public int getDecimalState(int i, int j)
    {
        if(i < rows - 1 && j < cols - 1)
            return 8*vertex[i][j] + 4*vertex[i][j+1] + 2*vertex[i+1][j] + vertex[i+1][j+1];
        return -1;
    }



}
  public void settings() {  size(512, 512); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "marching_squares" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
