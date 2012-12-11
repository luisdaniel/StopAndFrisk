class Panel {
  int race;
  String streetName1;
  String streetName2;
  int uniform;
  int changedDirection;
  int searched;
  int frisked;
  int summons;
  int arrest;
  String reasonForStop;
  String reasonForFrisk;
  String reasonForSearch;
  String summonsOffense;
  String arrestOffense;
  float alpha;
  int numStops;
  String suspect;
  PVector position = new PVector();
  PVector targetPosition = new PVector();

  PImage p1 = new PImage();
  PImage p2, p3, p4, p5, p6;


  void drawPanel() {
    pushMatrix(); 
    {
      translate(position.x, position.y);
      //text(suspect, 0, 0);
      text(numStops, 0, 0);
    } 
    popMatrix();
  }

  void update() {
    position.lerp(targetPosition, .1);
  }

  void fromCSV(String[] input) {
    race = int(input[5]);
    streetName1 = input[74];
    streetName2 = input[75];
    uniform = int(input[85]);
    changedDirection = int(input[64]);
    searched = int(input[13]);
    frisked = int(input[12]);
    summons = int(input[23]);
    arrest = int(input[21]);
    for (int j = 38; j < 48; j++) {
      if (int(input[j]) == 1) {
        reasonForStop = input[j];
      }
    }
    for (int j = 48; j < 57; j++) {
      if (int(input[j]) == 1) {
        reasonForFrisk = input[j];
      }
    }
    for (int j = 57; j < 61; j++) {
      if (int(input[j]) == 1) {
        reasonForSearch = input[j];
      }
    }
    summonsOffense = input[24];
    arrestOffense = input[22];
    suspect = input[93];
  }


  void loadPanel() {
    int action;
    tint(255, 255/numStops);
    String fileName;


    //PANEL 1
    fileName = "panel1-"+race+".jpg";
    p1 = loadImage(fileName);
    image(p1, 0, 0);

    //PANELL 2
    fileName = "panel2-"+race+"-"+uniform+".jpg";
    p2 = loadImage(fileName);
    image(p2, width/3, 0);

    //PANEL 3
    fileName = "panel3-"+race+"-"+uniform+".jpg";
    p3 = loadImage(fileName);
    image(p3, 2*width/3, 0);

    //PANEL 4
    fileName = "panel4-"+uniform+".jpg";
    p4 = loadImage(fileName);
    image(p4, 0, height/2);

    //PANEL 5
    if (searched == 1) {
      action = 1;
    } 
    else if (frisked == 2) {
      action = 2;
    } 
    else {
      action = 0;
    }
    fileName = "panel5-"+race+"-"+uniform+"-"+action+".jpg";
    p4 = loadImage(fileName);
    image(p4, width/3, height/2);

    //PANEL 6
    if (summons == 1) {
      action = 1;
    } 
    else if (arrest == 2) {
      action = 2;
    } 
    else {
      action = 0;
    }
    fileName = "panel6-"+race+"-"+uniform+"-"+action+".jpg";
    p4 = loadImage(fileName);
    image(p4, 2*width/3, height/2);
  }
}

