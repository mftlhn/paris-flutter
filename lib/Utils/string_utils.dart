class StringUtils {
  String capitalizeName(String name) {
    String lowering = name.toLowerCase();
    StringBuffer kalimatBaru = new StringBuffer();

    for (String kata in lowering.split("")) {
      String newName = kata.substring(0, 1).toUpperCase() + kata.substring(1);

      kalimatBaru.write(newName);
    }
    return kalimatBaru.toString();
  }
}
