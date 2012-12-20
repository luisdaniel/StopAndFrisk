import java.util.Collections;
import processing.pdf.*;

ArrayList<Panel> panelList = new ArrayList();
ArrayList<PanelBin> binList = new ArrayList();
HashMap<String, PanelBin> binHash = new HashMap(); 

float fullWidth = 0;
float tscrollOffset = 0;
float scrollOffset = 0;
PFont labelFont;
PFont dialogFont;

boolean record;


int susp = 999;

void setup() {
  //size(1200, 754, PDF, "SNF9.pdf");
  size(1200, 754);
  //beginRecord(PDF, "stopAndrisk-####.pdf");
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
  //PGraphicsPDF pdf = (PGraphicsPDF) g;

//  for (int i = 0; i < 10; i++) {
//    background(255);
//    PanelBin bin = binList.get(i);
//    for ( Panel p: bin.panelList) {
//      p.loadPanel();
//      //pdf.nextPage();
//    }
//  }
  //exit();
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
      p.stopNum = j;
      p.suspectNum = i;
    }
  }
}









void loadImages(int suspect) {
  background(255);
  PanelBin bin = binList.get(suspect);
  for ( Panel p: bin.panelList) {
    p.loadPanel();
  }
  //  bin.panelList.get(0).loadPanel();
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

//  if (key =='0') susp = 0;
//  else if (key == '1') susp = 1;
//  else if ( key == '2') susp = 2;
//  else if ( key == '3') susp = 3;
//  else if ( key == '4') susp = 4;
//  else if ( key == '5') susp = 5;
//  else if ( key == '6') susp = 6;
//  else if ( key == '7') susp = 7;
//  else if ( key == '8') susp = 8;
//  else if ( key == '9') susp = 9;
}

