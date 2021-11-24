// It contains any helpful method that we can use anywhere

String getUsableDate(String date){
  // takes (2021-10-28T16:42:13Z)
  // returns (Month day, year .... example: May 27, 2021)
  String usableDate = "";

  String numbersDate = date.split("T")[0];
  print("numbersDate " + numbersDate);
  String year = numbersDate.split("-")[0];
  print("year " + year);
  String month = numbersDate.split("-")[1];
  //TODO: if the moth starts with 0 list( 2021-07-21 )
  if(month.startsWith("0"))
    month = month[1];
  String day = numbersDate.split("-")[2];

  String monthString = months[int.parse(month) - 1];

  usableDate = monthString +" "+day+", "+year;

  return usableDate;
}

List<String> months = [
  'Jan',
  'Feb',
  'Mar',
  'April',
  'May',
  'June',
  'July',
  'Aug',
  'Sept',
  'Oct',
  'Nov',
  'Dec'
];