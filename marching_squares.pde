Field field;

void setup()
{
    size(512, 512);
    field = new Field();
    field.generate();
}

void draw()
{
    background(100);
    field.drawPoints();
    field.drawBounderies();
    noLoop();
}