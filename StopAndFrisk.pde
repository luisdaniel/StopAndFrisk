import java.util.Collections;

ArrayList<Panel> panelList = new ArrayList();
ArrayList<PanelBin> binList = new ArrayList();
HashMap<String, PanelBin> binHash = new HashMap(); 

float fullWidth = 0;
float tscrollOffset = 0;
float scrollOffset = 0;
PFont labelFont;


void setup() {
  size(1200, 754);
  //smooth(4);
  labelFont = createFont("Helvetica", 24);
  textFont(labelFont);
  textSize(12);
  loadPanels();
  Collections.sort(binList);
  Collections.reverse(binList);
  sortBySuspect();

  background(255);
  PanelBin bin = binList.get(0);
  for ( Panel p: bin.panelList) {
    p.loadPanel();
  }
  
  drawPermanentFeatures();
}



void draw() {




//
//  //background(0);
//  tscrollOffset= -map(mouseX, 0, width, fullWidth - width, 0);
//
//  //easing
//  scrollOffset = lerp(scrollOffset, tscrollOffset, .1);
//  translate(scrollOffset, 0);
//  for ( Panel p: panelList) {
//    p.update();
//    p.drawPanel();
//  }
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

// void countChemicals() {
// for (int i = 0; i < binList.size(); i++) { //list of a list
//   ChemicalBin bin = binList.get(i);    
//   
//   for (int j = 0; j < bin.chemicalList.size(); j++) { //list of chemicals
//     
//     ChemicalObject chem = bin.chemicalList.get(j);
//     if(chem.isMetal == 0) {
//       fill(255,0,0);
//     } else {
//       fill(0, 255, 0);
//     }
//   ellipse (i*50, height/2, bin.chemicalList.size()/5,bin.chemicalList.size()/5); 
//   println ("size: " + bin.chemicalList.size()); 
//   }
// }
//}
void sortBySuspect() {
  //  float x = 0;
  //  for (int i = 0; i < binList.size(); i++) {
  //    PanelBin bin = binList.get(i);
  //    //float x = i * 40;
  //    for (int j = 0 ; j < bin.panelList.size(); j++) {
  //      Panel p = bin.panelList.get(j);
  //      float y = height/2-j *10;
  //      p.targetPosition = new PVector(x, y);
  //    }
  //    x+= textWidth(bin.suspect)+2;
  //  }
  //  fullWidth = x;

  ///size
  for (int i = 0; i < binList.size(); i++) {
    PanelBin bin = binList.get(i);
    for (int j = 0 ; j < bin.panelList.size(); j++) {
      Panel p = bin.panelList.get(j);
      p.numStops = bin.panelList.size();
      //println(p.numStops);
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





