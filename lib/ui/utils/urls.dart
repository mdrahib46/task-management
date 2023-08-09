class Urls{

  Urls._();

  static const String _baseurl='https://task.teamrabbil.com/api/v1';
  static String registration='$_baseurl/registration';
  static String login='$_baseurl/login';
  static String createTask='$_baseurl/createTask';
  static String taskStatusCount='$_baseurl/taskStatusCount';
  static String newTasks = '$_baseurl/listTaskByStatus/New';
  static String inProgressTasks = '$_baseurl/listTaskByStatus/Progress';
}