// 목표
class Goal{
  final String userId;
  final String goalId;
  final String goalName;
  final String goalDetail;
  final int goalSeconds;
  final int accumulateSeconds;
  final double goalPercent;
  final String goalStat;
  final String color;
  final List<int> writeDate;
  final List<int> modifyDate;

  Goal({
    required this.userId,
    required this.goalId,
    required this.goalName,
    required this.goalDetail,
    required this.goalSeconds,
    required this.accumulateSeconds,
    required this.goalPercent,
    required this.goalStat,
    required this.color,
    required this.writeDate,
    required this.modifyDate,
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
      writeDate: List<int>.from(json['write_date']),
      modifyDate: List<int>.from(json['modify_date']),
    );
  }

}