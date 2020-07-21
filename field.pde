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
            for(int j = 0; j < cols-1; j++)
            {
                PVector a = new PVector(i*SIZE + SIZE*0.5, j*SIZE);
                PVector b = new PVector(i*SIZE + SIZE, j*SIZE + SIZE*0.5);
                PVector c = new PVector(i*SIZE + SIZE*0.5, j*SIZE + SIZE);
                PVector d = new PVector(i*SIZE, j*SIZE + SIZE*0.5);
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
    
    void lineV(PVector v1, PVector v2)
    {
        line(v1.x, v1.y, v2.x, v2.y);
    }
    // String getStateBinary(int i, int j)
    // {
    //     if(i < rows - 1 && j < cols - 1)
    //         return new String(vertex[i][j] + vertex[i][j+1] + vertex[i+1][j] + vertex[i+1][j+1]);
    //     return "-";
    // }

    int getDecimalState(int i, int j)
    {
        if(i < rows - 1 && j < cols - 1)
            return 8*vertex[i][j] + 4*vertex[i][j+1] + 2*vertex[i+1][j] + vertex[i+1][j+1];
        return -1;
    }



}