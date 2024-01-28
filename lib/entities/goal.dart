// 목표
class Goal{
  final String userId;
   String goalId;
  String goalName;
  String goalDetail;
  int goalSeconds;
  int accumulateSeconds;
  double goalPercent;
  String goalStat;
  String color;
  String writeDate; // 변경 예정
  String modifyDate; // 변경 예정

  Goal({
    required this.userId,
    this.goalId = 'temp', // 저장시 서버에서 채변
    this.goalName = '',
    this.goalDetail = '',
    this.goalSeconds = 0,
    this.accumulateSeconds = 0,
    this.goalPercent = 0,
    this.goalStat = 'N',
    this.color = 'ED4141',
    this.writeDate = '',
    this.modifyDate = ''
  });

  factory Goal.fromJson(Map<String, dynamic> json) {
    return Goal(
      userId: json['user_id'],
      goalId: json['goal_id'],
      goalName: json['goal_name'],
      goalDetail: json['goal_detail'],
      goalSeconds: json['goal_seconds'],
      accumulateSeconds: json['accumulate_seconds'],
      goalPercent: json['goal_percent'],
      goalStat: json['goal_stat'],
      color: json['color'],
      //writeDate: List<int>.from(json['write_date']),
      //modifyDate: List<int>.from(json['modify_date']),
    );
  }


  Map<String, dynamic> toJson() {
    return {
      'user_id': userId,
      'goal_id': goalId,
      'goal_name': goalName,
      'goal_detail': goalDetail,
      'goal_seconds': goalSeconds,
      'accumulate_seconds': accumulateSeconds,
      'goal_percent': goalPercent,
      'goal_stat': goalStat,
      'color': color,
    };
  }
}