//Zona de Variables
color bgCol = color(241,250,238);
color lineCol = color(230,57,70);
//-----Name animation
color nameCol = color(69,123,157);
float nameWeight = 5;
float count = 0;
float base_arc_incr = 30;
float base_line_incr = 10;
float base_rad = 50;
//-------g------control vars
PVector g_pos = new PVector(100,100);
float g_arc = 30;
boolean g_arc_done = false;
float g_line = 70;
boolean g_line_done = false;
float g_arc_2 = 0;
boolean g_done = false;
//-------e------control vars
PVector e_pos = new PVector(180,100);
float e_arc = 60;
boolean e_arc_done = false;
float e_line = 205;
boolean e_done = false;
//-------r-1-----control vars
PVector r1_pos = new PVector(225,70);
float r1_line = 70;
boolean r1_line_done = false;
float r1_arc = 180;
boolean r1_done = false;
//-------a------control vars
PVector a_pos = new PVector(290,100);
float a_arc = 0;
boolean a_arc_done = false;
float a_line = 70;
boolean a_done = false;
//-------r-2-----control vars
PVector r2_pos = new PVector(340,70);
float r2_line = 70;
boolean r2_line_done = false;
float r2_arc = 180;
boolean r2_done = false;
//-------d------control vars
PVector d_pos = new PVector(425,30);
float d_line = 30;
boolean d_line_done = false;
float d_arc = 0;
boolean d_done = false;

//-----Module name Bezier
color bezierCol = color(29,53,87);
//---A---
PVector a_line1_point1 = new PVector(640,80);
PVector a_line1_point2 = new PVector(340,40);
PVector a_line2_point1 = new PVector(660,360);
PVector a_line2_point2 = new PVector(360,320);
PVector a_mayus_line1 = new PVector(450,200);
PVector a_mayus_line2 = new PVector(650,200);
//---3---
PVector _3_line1_point1 = new PVector(120,80);
PVector _3_line1_point2 = new PVector(320,20);
PVector _3_line2_point1 = new PVector(320,300);
PVector _3_line2_point2 = new PVector(120,300);

//Ball management
//Bouncing ball
int circleSize = 50;
int speed = 5;

int degr = 0;

PVector ballPos = new PVector(0,0);
PVector ballVel = new PVector(10,0);
PVector ballAcc = new PVector(0,9.81);

color ballCol = color(168,218,220);
color strokeBallCol = color(255);

float ballRad = 50;

float dt = 0.33;

int ball_count = 0;
int maxBounces = 8;

//Zona setup  
void setup()
{
  size(1200,400);

}

//Zona draw
void draw()
{
  background(bgCol); 
  //Ball management
  /*
    A continuació es fa el control de la pilot a que rebota ultilitzant les formules del moviment del MRUA.
    Les forces que interactuen aqui son una velocitat inicial de +10 en l'eix horitzontal i una acceleracio de +9.81(gravetat)
    Es fa un contador del nombre de rebots per a poder reiniciar la bola en la posicio inicial, tambe es podria fer en una posicio aleatoria
    controlada, en el cas es tindria que modificar el seguent if
    Per a controlar que no surti de pantalla es fan els dos seguents if el primer per a que no es passi en moviment vertical i el segon per
    a que no es passi en horitzontal, a mes a mes fa un rebot senzill en aquest apartat.
    Per ultim es pinta en la posicio actualitzada, amb els colors pertinents i el radi.
  */
if(ball_count > maxBounces)
  {
    ballPos = new PVector(0,0);
    ballVel = new PVector(5,0);
    ball_count = 0;
  }
  
 //Vel
  ballVel.x = ballVel.x + 0.5 * ballAcc.x * dt;
  ballVel.y = ballVel.y + 0.5 * ballAcc.y * dt;
 //Pos
  ballPos.x = ballPos.x + ballVel.x * dt;
  ballPos.y = ballPos.y + ballVel.y * dt;
  
  if(ballPos.y>= height || ballPos.y<0)
  {
    ballVel.y = -ballVel.y;
    ball_count++;
  }
  if(ballPos.x >= width || ballPos.x<0)
  {
    ballVel.x = -ballVel.x;
    ball_count++;
  }  
  
  stroke(strokeBallCol);
  strokeWeight(3);
  fill(ballCol);
  ellipse(ballPos.x,ballPos.y,ballRad,ballRad);
  
  //------------Name geometry
  /*
  A continuacio tenim el control del simulat d'escriptura del nom (en minuscules, 'gerard'), per a controlar el "temps" o frames que es fan per a cada operaco
  utilitzo un contador (count) en el que a cada iteració del draw() es suma 1, a continuació en cada fraccio d'escriptura utilitzem aquest valor count per a trobar 
  que 1 de cada vegades que el draw dibuixi "escriurem" un troç mes fins a completar el reccoregut actual, a mes a mes tenim variables de control per a poder 
  saber quan ha acabat un proces o una lletra i poder començar la seguent fase.
  Per a controlar que la fase o lletra esta completa es comprova si el valor actual de la variable de progres es major o igual a un valor menor que el que busquem 
  i a menys distancia del increment que utilitzem.
  Totes les lletres estan fetes a partir de arc i line, utiltizan com a ajuda la funcio radians(), la qual al passarli un valor en graus els transforma a radians.
  Totes les lletres estan referenciades a partir d'unes variables del tipus PVector que crea un parell de float, per a cada lletra existeix un unic PVector.
  */
  count++;
  noFill();
  stroke(lineCol);
  line(30,140,460,140);
  stroke(nameCol);
  strokeWeight(5);
  //----------g-------
  if(count%5==0 && g_arc<=310)
  {
    g_arc +=base_arc_incr;
  }
  if(g_arc>=310)
  {
    g_arc_done =true;
  }
  arc(g_pos.x,g_pos.y,base_rad,base_rad,radians(30),radians(g_arc));
  if(count%5==0 && g_line<=150 && g_arc_done)
  {
    g_line += base_line_incr;
  }
  if(g_arc_done)
  {
    line(g_pos.x+22,g_pos.y-30,g_pos.x+22,g_line);
  }
  if(g_line>=150)
  {
    g_line_done = true;
  }
  if(count%5==0 && g_arc_2<=140 && g_line_done)
  {
    g_arc_2 += base_arc_incr;
  }
  if(g_line_done)
  {
    arc(g_pos.x-3,g_pos.y+60,base_rad,base_rad,0,radians(g_arc_2));
  }
  if(g_arc_2>=140)
  {
    g_done = true;
  }
  //----------e-------
   if(count%5==0 && e_arc<=350 && g_done)
  {
    e_arc += base_arc_incr;
  }
  if(e_arc >=350)
  {
    e_arc_done = true;
  }
  if(g_done)
  {
  arc(180,100,base_rad,base_rad,radians(60),radians(e_arc));
  }
  if(count%5==0 && e_arc_done && e_line>=160)
  {
   e_line -= base_line_incr; 
  }
  if(e_arc_done)
  {
    line(e_line,e_pos.y,e_pos.x+25,e_pos.y);
  }
  if(e_line<=160)
  {
    e_done = true;
  }
  //----------r-1------
  if(count%5==0 && e_done && r1_line<=125)
  {
    r1_line += base_line_incr;
  }
  if(r1_line>=75)
  {
    line(r1_pos.x,r1_pos.y,r1_pos.x,r1_line);
  }
  if(r1_line>=125)
  {
    r1_line_done = true;
  }
  if(count%5==0 && r1_line_done && r1_arc<=260)
  {
    r1_arc += base_arc_incr;
  }
  if(r1_line_done)
  {
    arc(r1_pos.x+25,r1_pos.y+30,base_rad,base_rad,radians(180),radians(r1_arc));
  }
  if(r1_arc>=260)
  {
    r1_done = true;
  }
  //----------a-------
  if(count%5==0 && r1_done && a_arc<=360)
  {
    a_arc += base_arc_incr;
  }
  if(a_arc>10)
  {
   arc(a_pos.x,a_pos.y,base_rad,base_rad,radians(0),radians(a_arc));
  }
  if(a_arc>=350)
  {
    a_arc_done = true;
  }
  if(count%5==0 && a_arc_done && a_line<125)
  {
   a_line += base_line_incr;
  }
  if(a_line>75)
  {
    line(a_pos.x+25,a_pos.y-30,a_pos.x+25,a_line);
  }
  if(a_line>=125)
  {
    a_done = true;
  }
  //----------r-2------
    if(count%5==0 && a_done && r2_line<=125)
  {
    r2_line += base_line_incr;
  }
  if(r2_line>=75)
  {
    line(r2_pos.x,r2_pos.y,340,r2_line);//340,70
  }
  if(r2_line>=125)
  {
    r2_line_done = true;
  }
  if(count%5==0 && r2_line_done && r2_arc<=260)
  {
    r2_arc += base_arc_incr;
  }
  if(r2_line_done)
  {
    arc(r2_pos.x+25,r2_pos.y+30,base_rad,base_rad,radians(180),radians(r2_arc));
  }
  if(r2_arc>=250)
  {
    r2_done = true;
  }
  //----------d-------
  if(count%5==0 && r2_done && d_line<125)
  {
   d_line += base_line_incr;
  }
  if(d_line>30)
  {
    line(d_pos.x,d_pos.y,d_pos.x,d_line);
  }
  if(d_line>=125)
  {
    d_line_done = true;
  } 
  if(count%5==0 && d_line_done && d_arc<=360)
  {
    d_arc += base_arc_incr;
  }
  if(d_arc>10)
  {
   arc(d_pos.x-25,d_pos.y+70,base_rad,base_rad,radians(0),radians(d_arc));
  }
  if(d_arc>=350)
  {
    d_done = true;
  }
  
 //Shapes bezier to make "A3D"
 /*
 A continuació es fa un us del mode de curbes de bezier en el que podem veure que com a les lletres anteriors utilitzem parells de PVector per a les linies que 
 formen una curba de bezier, en cada una de les corbes es composa de dues rectes es a dir 4 punts, per aixo utilitzo la nomenclatura aquesta en el nom de les 
 variables.
 En el 3 a mes a mes de voler mostrar una corba de bezier, tambe volia ensenya el pushMatrix() i popMatrix(), dues funcions que creen una "zona" en la que si 
 utilitzes el translate(), el scale() o rotate() no afecta a les proximes figures generades, nomes a les del interior.
 
 */
  //--------A shape
  stroke(bezierCol);
  strokeWeight(16);
  bezier(a_line1_point1.x,a_line1_point1.y,a_line1_point2.x,a_line1_point2.y,a_line2_point1.x,a_line2_point1.y,a_line2_point2.x,a_line2_point2.y);
  bezier(a_line2_point1.x+180,a_line2_point1.y,a_line2_point2.x+180,a_line2_point2.y,a_line1_point1.x+180,a_line1_point1.y,a_line1_point2.x+180,a_line1_point2.y);
  line(a_mayus_line1.x,a_mayus_line1.y,a_mayus_line2.x,a_mayus_line2.y);
  //-------3 shape
  strokeWeight(32);
  pushMatrix();
  translate(756,25);
  scale(0.5);
  bezier(_3_line1_point1.x,_3_line1_point1.y,_3_line1_point2.x,_3_line1_point2.y,_3_line2_point1.x,_3_line2_point1.y,_3_line2_point2.x,_3_line2_point2.y);
  translate(0,220);
  bezier(_3_line1_point1.x,_3_line1_point1.y,_3_line1_point2.x,_3_line1_point2.y,_3_line2_point1.x,_3_line2_point1.y,_3_line2_point2.x,_3_line2_point2.y);
  popMatrix();
  //------D shape
  strokeWeight(16);
  pushMatrix();
  translate(900,0);
  bezier(_3_line1_point1.x,_3_line1_point1.y,_3_line1_point2.x,_3_line1_point2.y,_3_line2_point1.x,_3_line2_point1.y,_3_line2_point2.x,_3_line2_point2.y);
  popMatrix();
  line(1050,100,1050,300);
  
}
