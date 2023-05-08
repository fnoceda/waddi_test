enum AppHttpStatus {
  none, // when is not yet due any conections
  connecting, // conection in proccess
  success, // conection retriving data successfuly
  fail, // conection fail retriving data
  more, // conection again for example for infinite scroll the process restart
}
