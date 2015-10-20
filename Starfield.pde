Particle[] particles;
//your code here
void setup()
{
	//your code here
	particles= new Particle[200];

	for(int i=0;i<particles.length;i++){
		
		if(i%2==0||i%3==0||i%5==0){
			particles[i]=new OddballParticle();
		}
		else if(i%13==0){
			particles[i]=new JumboParticle();
		}else{
			particles[i]=new NormalParticle();
		}

	}
	size(400,400);
}
void draw()
{
	//your code here

	for(int i=0;i<particles.length;i++){
		particles[i].show();
		particles[i].move();
	}
	rectMode(CENTER);
	fill(0,0,0,20);
	rect(200,200,400,400);


}
class NormalParticle implements Particle
{
	//your code here
	float xPos;
	float yPos;
	int col;
	float ang;
	float spe;
	NormalParticle(){
		xPos=200;
		yPos=200;
		col=color((int)(Math.random()*255),(int)(Math.random()*255),(int)(Math.random()*255),(int)(Math.random()*255));
		ang=(float)(Math.random()*2*Math.PI);
		spe=4;
	}
	public void move(){
		xPos+=cos(ang)*spe;
		yPos+=sin(ang)*spe;
		if(xPos>=400||xPos<=0||yPos>=400||yPos<=0){
			xPos=200;
			yPos=200;
		}
		ang=ang-PI/360;
	}
	public void show(){
		stroke(col);
		fill(col);
		ellipse(xPos,yPos,10,10);
	}
}
interface Particle
{
	//your code here
	public void show();
	public void move();
}
class OddballParticle implements Particle//uses an interface
{
	//your code here
	float xOPos;
	float yOPos;
	int colO;
	float angO;
	float speO;
	OddballParticle(){
		xOPos=200;
		yOPos=200;
		colO=color((int)(Math.random()*255),(int)(Math.random()*255),(int)(Math.random()*255),(int)(Math.random()*255));
		angO=(float)(Math.random()*2*Math.PI);
		speO=4;
	}
	public void move(){
		xOPos+=cos(angO)*speO;
		yOPos+=sin(angO)*speO;
		if(xOPos>=400||xOPos<=0||yOPos>=400||yOPos<=0){
			xOPos=200;
			yOPos=200;
		}
		angO=angO-PI/360;
	}
	public void show(){
		stroke(colO);
		fill(colO);
		ellipse(xOPos,yOPos,(int)(Math.random()*20)-10,(int)(Math.random()*20)-10);
	}
	
	

}
class JumboParticle extends NormalParticle//uses inheritance
{
	//your code here
	float xJPos;
	float yJPos;
	int colJ;
	float angJ;
	float speJ;
	float wJ=0.0625;
	JumboParticle(){
		xJPos=200;
		yJPos=200;
		colJ=color((int)(Math.random()*255),(int)(Math.random()*255),(int)(Math.random()*255),(int)(Math.random()*255));
		angJ=(float)(Math.random()*2*Math.PI);
		speJ=4;
	}
	
	public void move(){
		xJPos+=cos(angJ)*speJ+(int)(Math.random()*10-5);
		yJPos+=sin(angJ)*speJ+(int)(Math.random()*10-5);
		wJ=wJ+0.0625;
		if(xJPos>=400||xJPos<=0||yJPos>=400||yJPos<=0){
			xJPos=200;
			yJPos=200;
			wJ=0.0625;
		}
		
	}
	public void show(){
		if(xJPos>200){fishR(xJPos,yJPos,wJ
			);}else{


		fishF(xJPos,yJPos,wJ);}

}

void fishF(float fishX, float fishY,float w){
                  int[][] pix = 
                  {
                          {0,0,0,0,0,0,0,0,0,0,0,0,0,0,2,2,2,2,2,3,3,3,4,0,0,0,0,0,0,0,0,0,0,0,0},
                          {0,0,0,0,0,0,0,0,0,0,0,2,2,2,2,2,2,5,5,5,5,5,4,4,0,0,0,0,0,0,0,0,0,0,0},
                          {0,0,0,0,0,0,0,0,0,0,2,2,2,2,2,2,2,2,6,6,6,6,5,5,0,0,0,0,0,0,0,0,0,0,0},
                          {0,0,0,0,0,0,0,0,2,2,2,2,2,2,2,2,2,2,2,2,7,6,5,5,0,0,0,0,0,0,0,0,0,0,0},
                          {0,0,0,0,0,0,0,0,2,2,2,2,2,2,2,2,2,2,2,2,2,7,5,0,0,0,0,0,0,0,0,0,0,0,0},
                          {0,0,0,0,0,0,0,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,7,5,0,0,0,0,0,0,4,4,4,4,0},
                          {0,0,0,0,0,0,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,7,5,0,0,0,2,5,4,4,4,4,0},
                          {0,0,0,0,0,0,2,15,15,15,2,2,2,2,2,2,2,2,2,2,2,2,2,7,8,2,2,2,5,5,4,4,4,0,0},
                          {0,0,0,0,0,2,15,1,16,14,14,14,14,2,2,2,2,2,2,2,2,2,7,7,9,10,8,8,8,4,4,4,4,0,0},
                          {0,0,0,0,0,2,15,1,1,14,14,14,2,2,2,2,2,2,2,2,2,2,2,7,7,7,7,7,8,5,4,4,4,0,0},
                          {0,0,0,0,0,2,15,14,14,14,14,14,7,8,8,8,5,5,5,5,11,11,7,7,7,11,11,12,5,5,5,4,0,0,0},
                          {0,0,0,0,2,2,14,14,14,2,2,7,7,7,5,5,5,5,5,11,11,11,11,7,7,11,11,12,0,5,5,4,0,0,0},
                          {0,0,0,2,2,15,14,14,2,2,2,17,7,5,5,5,13,11,11,11,11,11,11,11,11,11,11,12,0,0,5,5,0,0,0},
                          {0,0,2,2,2,15,15,12,14,14,14,7,5,13,13,13,13,13,11,11,11,11,11,7,7,11,12,0,0,0,0,5,0,0,0},
                          {0,0,0,15,15,15,15,12,12,12,14,14,5,13,13,13,13,11,11,11,11,11,7,7,7,12,0,0,0,0,0,0,0,0,0},
                          {0,0,0,0,0,0,0,12,12,12,12,12,12,12,13,13,13,13,11,11,11,8,7,7,7,12,0,0,0,0,0,0,0,0,0},
                          {0,0,0,0,0,0,0,0,0,12,12,12,12,12,12,13,13,13,7,7,8,8,8,8,12,0,0,0,0,0,0,0,0,0,0},
                          {0,0,0,0,0,0,0,0,0,0,0,0,12,12,12,11,11,11,11,11,11,0,0,0,0,12,0,0,0,0,0,0,0,0,0},
                          {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,12,12,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
                          {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
                  };
                                   color color1 = color(0, 0, 0);
                  color color2 = color((int)(Math.random()*255), (int)(Math.random()*255), (int)(Math.random()*255));
                  color color3 = color((int)(Math.random()*255), (int)(Math.random()*255), (int)(Math.random()*255));
                  color color4 = color((int)(Math.random()*255), (int)(Math.random()*255), (int)(Math.random()*255));
                  color color5 = color((int)(Math.random()*255), (int)(Math.random()*255), (int)(Math.random()*255));
                  color color6 = color((int)(Math.random()*255), (int)(Math.random()*255), (int)(Math.random()*255));
                  color color7 = color((int)(Math.random()*255), (int)(Math.random()*255), (int)(Math.random()*255));
                  color color8 = color((int)(Math.random()*255), (int)(Math.random()*255), (int)(Math.random()*255));
                  color color9 = color((int)(Math.random()*255), (int)(Math.random()*255), (int)(Math.random()*255));
                  color color10 = color((int)(Math.random()*255), (int)(Math.random()*255), (int)(Math.random()*255));
                  color color11 = color((int)(Math.random()*255), (int)(Math.random()*255), (int)(Math.random()*255));
                  color color12 = color((int)(Math.random()*255), (int)(Math.random()*255), (int)(Math.random()*255));
                  color color13 = color((int)(Math.random()*255), (int)(Math.random()*255), (int)(Math.random()*255));
                  color color14 =color((int)(Math.random()*255), (int)(Math.random()*255), (int)(Math.random()*255));
                  color color15 =color((int)(Math.random()*255), (int)(Math.random()*255), (int)(Math.random()*255));
                  color color16 =color(255, 255, 255);
                  color color17 =color((int)(Math.random()*255), (int)(Math.random()*255), (int)(Math.random()*255));

                  float h=w;
                  int a=0;
                  for(int p = 0; p < pix.length; p += 1)
                  {
                      for (int i = 0; i < pix[p].length ; i += 1)
                      { 
                          if(pix[p][i] == 1)
                          {
                              fill(color1);
                              stroke(color1);
                              rect(i + fishX+a, fishY, w, h);
                          }
                          if(pix[p][i] == 2)
                          {
                              fill(color2);
                              stroke(color2);
                              rect(i + fishX+a, fishY, w, h);
                          }
                          if(pix[p][i] == 3)
                          {
                              fill(color3);
                              stroke(color3);
                              rect(i + fishX+a, fishY, w, h);
                          }
                          if(pix[p][i] == 4)
                          {
                              fill(color4);
                              stroke(color4);
                              rect(i + fishX+a, fishY, w, h);
                          }
                          if(pix[p][i] == 5)
                          {
                              fill(color5);
                              stroke(color5);
                              rect(i + fishX+a, fishY, w, h);
                          }
                          if(pix[p][i] == 6)
                          {
                              fill(color6);
                              stroke(color6);
                              rect(i + fishX+a, fishY, w, h);
                          }
                          if(pix[p][i] == 7)
                          {
                              fill(color7);
                              stroke(color7);
                              rect(i + fishX+a, fishY, w, h);
                          }
                          if(pix[p][i] == 8)
                          {
                              fill(color8);
                              stroke(color8);
                              rect(i + fishX+a, fishY, w, h);
                          }
                          if(pix[p][i] == 9)
                          {
                              fill(color9);
                              stroke(color9);
                              rect(i + fishX+a, fishY, w, h);
                          }           
                          if(pix[p][i] == 10)
                          {
                              fill(color10);
                              stroke(color10);
                              rect(i + fishX+a, fishY, w, h);
                          }
                          if(pix[p][i] == 11)
                          {
                              fill(color11);
                              stroke(color11);
                              rect(i + fishX+a, fishY, w, h);
                          }
                          if(pix[p][i] == 12)
                          {
                              fill(color12);
                              stroke(color12);
                              rect(i + fishX+a, fishY, w, h);
                          }
                          if(pix[p][i] == 13)
                          {
                              fill(color13);
                              stroke(color13);
                              rect(i + fishX+a, fishY, w, h);
                          }
                          if(pix[p][i] == 14)
                          {
                              fill(color14);
                              stroke(color14);
                              rect(i + fishX+a, fishY, w, h);
                          }
                           if(pix[p][i] == 15)
                          {
                              fill(color15);
                              stroke(color15);
                              rect(i + fishX+a, fishY, w, h);
                          }
                          if(pix[p][i] == 16)
                          {
                              fill(color16);
                              stroke(color16);
                              rect(i + fishX+a, fishY, w, h);
                          }
                          if(pix[p][i] == 17)
                          {
                              fill(color17);
                              stroke(color17);
                              rect(i + fishX+a, fishY, w, h);
                          }
                          a += w;//makes pix equally distant
                      }
                      fishY += h+1;//makes //makes pix equally distant
                      a =0;//makes it so that every row is not always ongoing based on "a" value from "a += w"
                  }
              }
void fishR(float fishX,float fishY, float w){
 	        int[][] pix = 
            {
                {0,0,0,0,0,0,0,0,0,0,0,0,4,3,3,3,2,2,2,2,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
                {0,0,0,0,0,0,0,0,0,0,0,4,4,5,5,5,5,5,2,2,2,2,2,2,0,0,0,0,0,0,0,0,0,0,0},
                {0,0,0,0,0,0,0,0,0,0,0,5,5,6,6,6,6,2,2,2,2,2,2,2,2,0,0,0,0,0,0,0,0,0,0},
                {0,0,0,0,0,0,0,0,0,0,0,5,5,6,7,2,2,2,2,2,2,2,2,2,2,2,2,0,0,0,0,0,0,0,0},
                {0,0,0,0,0,0,0,0,0,0,0,0,5,7,2,2,2,2,2,2,2,2,2,2,2,2,2,0,0,0,0,0,0,0,0},
                {0,4,4,4,4,0,0,0,0,0,0,5,7,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,0,0,0,0,0,0,0},
                {0,4,4,4,4,5,2,0,0,0,5,7,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,0,0,0,0,0,0},
                {0,0,4,4,4,5,5,2,2,2,8,7,2,2,2,2,2,2,2,2,2,2,2,2,2,15,15,15,2,0,0,0,0,0,0},
                {0,0,4,4,4,4,8,8,8,10,9,7,7,2,2,2,2,2,2,2,2,2,14,14,14,14,16,1,15,2,0,0,0,0,0},
                {0,0,4,4,4,5,8,7,7,7,7,7,2,2,2,2,2,2,2,2,2,2,2,14,14,14,1,1,15,2,0,0,0,0,0},
                {0,0,0,4,5,5,5,12,11,11,7,7,7,11,11,5,5,5,5,8,8,8,7,14,14,14,14,14,15,2,0,0,0,0,0},
                {0,0,0,4,5,5,0,12,11,11,7,7,11,11,11,11,5,5,5,5,5,7,7,7,2,2,14,14,14,2,2,0,0,0,0},
                {0,0,0,5,5,0,0,12,11,11,11,11,11,11,11,11,11,11,13,5,5,5,7,17,2,2,2,14,14,15,2,2,0,0,0},
                {0,0,0,5,0,0,0,0,12,11,7,7,11,11,11,11,11,13,13,13,13,13,5,7,14,14,14,12,15,15,2,2,2,0,0},
                {0,0,0,0,0,0,0,0,0,12,7,7,7,11,11,11,11,11,13,13,13,13,5,14,14,12,12,12,15,15,15,15,0,0,0},
                {0,0,0,0,0,0,0,0,0,0,12,8,8,8,8,7,7,13,13,13,12,12,12,12,12,12,0,0,0,0,0,0,0,0,0},
                {0,0,0,0,0,0,0,0,0,12,0,0,0,0,11,11,11,11,11,11,12,12,12,0,0,0,0,0,0,0,0,0,0,0,0},
                {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,12,12,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
             };
                  color color1 = color(0, 0, 0);
                  color color2 = color((int)(Math.random()*255), (int)(Math.random()*255), (int)(Math.random()*255));
                  color color3 = color((int)(Math.random()*255), (int)(Math.random()*255), (int)(Math.random()*255));
                  color color4 = color((int)(Math.random()*255), (int)(Math.random()*255), (int)(Math.random()*255));
                  color color5 = color((int)(Math.random()*255), (int)(Math.random()*255), (int)(Math.random()*255));
                  color color6 = color((int)(Math.random()*255), (int)(Math.random()*255), (int)(Math.random()*255));
                  color color7 = color((int)(Math.random()*255), (int)(Math.random()*255), (int)(Math.random()*255));
                  color color8 = color((int)(Math.random()*255), (int)(Math.random()*255), (int)(Math.random()*255));
                  color color9 = color((int)(Math.random()*255), (int)(Math.random()*255), (int)(Math.random()*255));
                  color color10 = color((int)(Math.random()*255), (int)(Math.random()*255), (int)(Math.random()*255));
                  color color11 = color((int)(Math.random()*255), (int)(Math.random()*255), (int)(Math.random()*255));
                  color color12 = color((int)(Math.random()*255), (int)(Math.random()*255), (int)(Math.random()*255));
                  color color13 = color((int)(Math.random()*255), (int)(Math.random()*255), (int)(Math.random()*255));
                  color color14 =color((int)(Math.random()*255), (int)(Math.random()*255), (int)(Math.random()*255));
                  color color15 =color((int)(Math.random()*255), (int)(Math.random()*255), (int)(Math.random()*255));
                  color color16 =color(255, 255, 255);
                  color color17 =color((int)(Math.random()*255), (int)(Math.random()*255), (int)(Math.random()*255));

                  float h=w;
                  int a=0;
                  for(int p = 0; p < pix.length; p += 1)
                  {
                      for (int i = 0; i < pix[p].length ; i += 1)
                      { 
                          if(pix[p][i] == 1)
                          {
                              fill(color1);
                              stroke(color1);
                              rect(i + fishX+a, fishY, w, h);
                          }
                          if(pix[p][i] == 2)
                          {
                              fill(color2);
                              stroke(color2);
                              rect(i + fishX+a, fishY, w, h);
                          }
                          if(pix[p][i] == 3)
                          {
                              fill(color3);
                              stroke(color3);
                              rect(i + fishX+a, fishY, w, h);
                          }
                          if(pix[p][i] == 4)
                          {
                              fill(color4);
                              stroke(color4);
                              rect(i + fishX+a, fishY, w, h);
                          }
                          if(pix[p][i] == 5)
                          {
                              fill(color5);
                              stroke(color5);
                              rect(i + fishX+a, fishY, w, h);
                          }
                          if(pix[p][i] == 6)
                          {
                              fill(color6);
                              stroke(color6);
                              rect(i + fishX+a, fishY, w, h);
                          }
                          if(pix[p][i] == 7)
                          {
                              fill(color7);
                              stroke(color7);
                              rect(i + fishX+a, fishY, w, h);
                          }
                          if(pix[p][i] == 8)
                          {
                              fill(color8);
                              stroke(color8);
                              rect(i + fishX+a, fishY, w, h);
                          }
                          if(pix[p][i] == 9)
                          {
                              fill(color9);
                              stroke(color9);
                              rect(i + fishX+a, fishY, w, h);
                          }           
                          if(pix[p][i] == 10)
                          {
                              fill(color10);
                              stroke(color10);
                              rect(i + fishX+a, fishY, w, h);
                          }
                          if(pix[p][i] == 11)
                          {
                              fill(color11);
                              stroke(color11);
                              rect(i + fishX+a, fishY, w, h);
                          }
                          if(pix[p][i] == 12)
                          {
                              fill(color12);
                              stroke(color12);
                              rect(i + fishX+a, fishY, w, h);
                          }
                          if(pix[p][i] == 13)
                          {
                              fill(color13);
                              stroke(color13);
                              rect(i + fishX+a, fishY, w, h);
                          }
                          if(pix[p][i] == 14)
                          {
                              fill(color14);
                              stroke(color14);
                              rect(i + fishX+a, fishY, w, h);
                          }
                           if(pix[p][i] == 15)
                          {
                              fill(color15);
                              stroke(color15);
                              rect(i + fishX+a, fishY, w, h);
                          }
                          if(pix[p][i] == 16)
                          {
                              fill(color16);
                              stroke(color16);
                              rect(i + fishX+a, fishY, w, h);
                          }
                          if(pix[p][i] == 17)
                          {
                              fill(color17);
                              stroke(color17);
                              rect(i + fishX+a, fishY, w, h);
                          }
                          a += w;//makes pix equally distant
                      }
                      fishY += h+1;//makes //makes pix equally distant
                      a =0;//makes it so that every row is not always ongoing based on "a" value from "a += w"
                  }
    			}    }      