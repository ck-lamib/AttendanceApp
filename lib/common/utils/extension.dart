extension GetTime on DateTime {
  String getDate() {
    return toString().split(" ").first;
  }
}
