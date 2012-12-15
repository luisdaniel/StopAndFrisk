import java.util.Collections;

ArrayList<Panel> panelList = new ArrayList();
ArrayList<PanelBin> binList = new ArrayList();
HashMap<String, PanelBin> binHash = new HashMap(); 

float fullWidth = 0;
float tscrollOffset = 0;
float scrollOffset = 0;
PFont labelFont;
PFont dialogFont;


void setup() {
  size(1200, 754);
  //smooth(4);
  labelFont = createFont("Helvetica", 24);
  dialogFont = loadFont("ComicSansMS-14.vlw");
  textFont(labelFont);
  textSize(12);
  loadPanels();
  Collections.sort(binList);
  Collections.reverse(binList);
  sortBySuspect();
}



void draw() {
}



void loadPanels() {
  String[] rows = loadStrings("multipleStops.csv");
  for (int i =1; i< rows.length; i++) {
    Panel p = new Panel();
    p.fromCSV(rows[i].split(","));
    panelList.add(p);
    String suspect = p.suspect;
    if (binHash.containsKey(suspect)) {
      PanelBin bin = binHash.get(suspect);
      bin.panelList.add(p);
    } 
    else {
      PanelBin bin = new PanelBin();
      bin.suspect = suspect;
      binHash.put(suspect, bin);
      binList.add(bin);
    }
  }
}


void sortBySuspect() {

  ///size
  for (int i = 0; i < binList.size(); i++) {
    PanelBin bin = binList.get(i);
    for (int j = 0 ; j < bin.panelList.size(); j++) {
      Panel p = bin.panelList.get(j);
      p.numStops = bin.panelList.size();
    }
  }
}





void drawPermanentFeatures() {
  strokeWeight(9);
  stroke(0);
  line(0, height/2, width, height/2);
  line(width/3, 0, width/3, height);
  line(2*width/3, 0, 2*width/3, height);
}



void loadImages(int suspect) {
  background(255);
  PanelBin bin = binList.get(suspect);
//  for ( Panel p: bin.panelList) {
//    p.loadPanel();
//  }
  bin.panelList.get(1).loadPanel();
  drawPermanentFeatures();
}

void keyPressed() {
  if (key =='0') loadImages(0);
  else if (key == '1') loadImages(1);
  else if ( key == '2') loadImages(2);
  else if ( key == '3') loadImages(3);
  else if ( key == '4') loadImages(4);
  else if ( key == '5') loadImages(5);
  else if ( key == '6') loadImages(6);
  else if ( key == '7') loadImages(7);
  else if ( key == '8') loadImages(8);
  else if ( key == '9') loadImages(9);
}

