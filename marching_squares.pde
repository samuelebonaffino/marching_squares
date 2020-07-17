Cell[][] grid;
int rows, cols;

void setup()
{
    size(512, 512);
    // fullScreen();
    initGrid();
}

void draw() 
{
    background(50);
    drawGrid();
    drawBounderies();
}

void initGrid()
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

void drawGrid()
{
    for(int i = 0; i < rows; i++)
        for(int j = 0; j < cols; j++)
            grid[i][j].drawVertex();
}

void drawBounderies()
{
    stroke(255);
    strokeWeight(1);
    for(int i = 0; i < rows; i++)
        for(int j = 0; j < cols; j++)
            grid[i][j].drawBound();
}

void drawGB()
{
    for(int i = 0; i < rows; i++)
        for(int j = 0; j < cols; j++)
        {
            grid[i][j].drawVertex();
            grid[i][j].drawBound();
        }
}