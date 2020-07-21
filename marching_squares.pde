Field field;
int t = 0;

void setup()
{
    size(512, 512);
    field = new Field();
}

void draw()
{
    if(t%120 == 0)
    {
        background(100);
        field.generate();
        field.drawPoints();
        field.drawBounderies();
    }
    updateTime();
}

void updateTime()
{
    t += 1;
    if(t > 3600)
        t = 0;
}