class Field
{
    final static int SIZE = 8;
    int rows, cols;
    int[][] vertex;

    Field()
    {
        rows = height/SIZE + 1;
        cols = width/SIZE + 1;
        vertex = new int[rows][cols];
    }

    void generate()
    {
        for(int i = 0; i < rows; i++)
            for(int j = 0; j < rows; j++)
                vertex[i][j] = floor(random(2));
    }

    void drawPoints()
    {
        noFill();
        strokeWeight(SIZE*0.5);
        for(int i = 0; i < rows; i++)
            for(int j = 0; j < cols; j++)
            {
                int x = j * SIZE;
                int y = i * SIZE;
                stroke(vertex[i][j]*255);;
                point(x, y);
            }
    }

    void drawBounderies()
    {
        stroke(255, 150, 0);
        strokeWeight(2);
        for(int i = 0; i < rows-1; i++)
        {
            int y = i*SIZE;
            for(int j = 0; j < cols-1; j++)
            {
                int x = j*SIZE;
                PVector a = new PVector(x + SIZE*0.5, y);
                PVector b = new PVector(x + SIZE, y + SIZE*0.5);
                PVector c = new PVector(x + SIZE*0.5, y + SIZE);
                PVector d = new PVector(x, y + SIZE*0.5);
                int state = getDecimalState(i, j);
                printState(state, i, j);
                switch(state) 
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
    }
    
    void drawABCD(PVector a, PVector b, PVector c, PVector d)
    {
        int r = 10;
        fill(255, 0, 0);
        ellipse(a.x, a.y, r, r);
        fill(0, 255, 0);
        ellipse(b.x, b.y, r, r);
        fill(0, 0, 255);
        ellipse(c.x, c.y, r, r);
        fill(255, 255);
        ellipse(d.x, d.y, r, r);
    }

    void printState(int state, int i, int j)
    {
        println("ID: " + i + "/" + j + ", state: " + state);
    }

    void lineV(PVector v1, PVector v2) 
    {
        line(v1.x, v1.y, v2.x, v2.y);
    }

    int getDecimalState(int i, int j)
    {
        if(i < rows - 1 && j < cols - 1)
            return 8*vertex[i][j] + 4*vertex[i][j+1] + 2*vertex[i+1][j] + vertex[i+1][j+1];
        return -1;
    }



}