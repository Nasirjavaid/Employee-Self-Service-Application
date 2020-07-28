class UserLogin {
  int id;
  String empNo;
  String empName;
  String designation;
  String empDepartment;
  String status;
  String dateOfJoining;
  String imageUrl;

  UserLogin(
      {this.id,
      this.empNo,
      this.empName,
      this.designation,
      this.empDepartment,
      this.status,
      this.dateOfJoining,
      this.imageUrl});

  UserLogin.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    empNo = json['empNo'];
    empName = json['empName'];
    designation = json['designation'];
    empDepartment = json['empDepartment'];
    status = json['status'];
    dateOfJoining = json['dateOfJoining'];
    imageUrl = json['imageUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['empNo'] = this.empNo;
    data['empName'] = this.empName;
    data['designation'] = this.designation;
    data['empDepartment'] = this.empDepartment;
    data['status'] = this.status;
    data['dateOfJoining'] = this.dateOfJoining;
    data['imageUrl'] = this.imageUrl;
    return data;
  }

  bool checkIfAnyIsNull() {
    return [id, empNo, empName, empDepartment,status,dateOfJoining].contains(null);
  }
}

 