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

  void drawPanel() {
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
    suspect = input[96];
  }
}

