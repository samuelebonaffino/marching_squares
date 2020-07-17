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

    void drawBound()
    {
        switch(binaryToDecimal())
        {
            case 1:
                break;
            case 2:
                line(x + SIZE*0.5, y + SIZE, x + SIZE, y + SIZE*0.5);
                break;
        }
    }

    void drawVertex()
    {
        strokeWeight(SIZE*0.5);
        stroke(vertex[A]*255);
        point(x, y);
        stroke(vertex[B]*255);
        point(x + SIZE, y);
        stroke(vertex[C]*255);
        point(x, y + SIZE);
        stroke(vertex[D]*255);
        point(x + SIZE, y + SIZE);
    }

    int binaryToDecimal()
    {
        return vertex[A] * 8 + 
               vertex[B] * 4 +
               vertex[C] * 2 +
               vertex[D] * 1 ;
    }

}