class LeaveSummary {
  int id;
  String leaveDateFrom;
  String leaveDateTo;
  int totalDays;
  String leaveType;

  LeaveSummary(
      {this.id,
      this.leaveDateFrom,
      this.leaveDateTo,
      this.totalDays,
      this.leaveType});

  LeaveSummary.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    leaveDateFrom = json['leaveDateFrom'];
    leaveDateTo = json['leaveDateTo'];
    totalDays = json['totalDays'];
    leaveType = json['leaveType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['leaveDateFrom'] = this.leaveDateFrom;
    data['leaveDateTo'] = this.leaveDateTo;
    data['totalDays'] = this.totalDays;
    data['leaveType'] = this.leaveType;
    return data;
  }
}