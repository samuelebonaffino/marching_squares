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

Cell[][] grid;
int rows, cols;

public void setup()
{
    
    // fullScreen();
    initGrid();
}

public void draw() 
{
    background(50);
    drawGrid();
    drawBounderies();
}

public void initGrid()
{
    int c = 0;
    rows = height/Cell.SIZE;
    cols = width/Cell.SIZE;
    grid = new Cell[rows][cols];

    for(int i = 0; i < rows; i++)
        for(int j = 0; j < cols; j++)
        {
            int x = j * Cell.SIZE;
            int y = i * Cell.SIZE;
            grid[i][j] = new Cell(c++, x, y);
        }
}

public void drawGrid()
{
    for(int i = 0; i < rows; i++)
        for(int j = 0; j < cols; j++)
            grid[i][j].drawVertex();
}

public void drawBounderies()
{
    stroke(255);
    strokeWeight(1);
    for(int i = 0; i < rows; i++)
        for(int j = 0; j < cols; j++)
            grid[i][j].drawBound();
}

public void drawGB()
{
    for(int i = 0; i < rows; i++)
        for(int j = 0; j < cols; j++)
        {
            grid[i][j].drawVertex();
            grid[i][j].drawBound();
        }
}
class Cell
{
    final static int SIZE = 10;
    final static int V = 4;
    final static int A = 0;
    final static int B = 1;
    final static int C = 2;
    final static int D = 3;

    int id, x, y;
    int[] vertex = new int[V];

    Cell(int id, int x, int y)
    {
        this.id = id;
        this.x = x;
        this.y = y;

        for(int i = 0; i < V; i++)
            vertex[i] = floor(random(2));
    }

    public void drawBound()
    {
        switch(binaryToDecimal())
        {
            case 1:
                break;
            case 2:
                line(x + SIZE*0.5f, y + SIZE, x + SIZE, y + SIZE*0.5f);
                break;
        }
    }

    public void drawVertex()
    {
        strokeWeight(SIZE*0.5f);
        stroke(vertex[A]*255);
        point(x, y);
        stroke(vertex[B]*255);
        point(x + SIZE, y);
        stroke(vertex[C]*255);
        point(x, y + SIZE);
        stroke(vertex[D]*255);
        point(x + SIZE, y + SIZE);
    }

    public int binaryToDecimal()
    {
        return vertex[A] * 8 + 
               vertex[B] * 4 +
               vertex[C] * 2 +
               vertex[D] * 1 ;
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
