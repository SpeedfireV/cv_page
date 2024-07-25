String platformsToString(List<String> platforms) {
  String finalString = platforms[0];
  for (int i = 1; i < platforms.length; i++){
    if (i != platforms.length - 1) {
      finalString += ", ${platforms[i]}";

    } else {
      finalString += " & ${platforms[i]}";
    }

  }
  return finalString;
}