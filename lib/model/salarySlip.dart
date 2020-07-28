import 'package:equatable/equatable.dart';

class SalarySlip  extends Equatable  {
  int id;
  String salaryIssueDate;
  String salaryMonth;
  int incomeTax;
  int salaryLoanBalance;
  int bikeLoanBalance;
  int totalDeduction;
  int currentPay;
  int basicPay;
  int houseRent;
  int utility;
  int workingDays;
  int ratePerDay;
  int earnedPay;
  int arrears;
  int netSalary;
  int netPayAble;


 SalarySlip(
      {this.id,
      this.salaryIssueDate,
      this.salaryMonth,
      this.incomeTax,
      this.salaryLoanBalance,
      this.bikeLoanBalance,
      this.totalDeduction,
      this.currentPay,
      this.basicPay,
      this.houseRent,
      this.utility,
      this.workingDays,
      this.ratePerDay,
      this.earnedPay,
      this.arrears,
      this.netSalary,
      this.netPayAble});


  @override
  List<Object> get props => [id,salaryIssueDate,salaryMonth,incomeTax,salaryLoanBalance,bikeLoanBalance,totalDeduction,
  currentPay,basicPay,houseRent,utility,workingDays,ratePerDay,earnedPay,earnedPay,arrears,netSalary,netPayAble];

 @override
  String toString() => 'Salary Slips { id: $id  salaryIssueDate :$salaryIssueDate}';

 

  SalarySlip.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    salaryIssueDate = json['salaryIssueDate'];
    salaryMonth = json['salaryMonth'];
    incomeTax = json['incomeTax'];
    salaryLoanBalance = json['SalaryLoanBalance'];
    bikeLoanBalance = json['bikeLoanBalance'];
    totalDeduction = json['totalDeduction'];
    currentPay = json['currentPay'];
    basicPay = json['basicPay'];
    houseRent = json['houseRent'];
    utility = json['utility'];
    workingDays = json['workingDays'];
    ratePerDay = json['ratePerDay'];
    earnedPay = json['earnedPay'];
    arrears = json['arrears'];
    netSalary = json['netSalary'];
    netPayAble = json['netPayAble'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['salaryIssueDate'] = this.salaryIssueDate;
    data['salaryMonth'] = this.salaryMonth;
    data['incomeTax'] = this.incomeTax;
    data['SalaryLoanBalance'] = this.salaryLoanBalance;
    data['bikeLoanBalance'] = this.bikeLoanBalance;
    data['totalDeduction'] = this.totalDeduction;
    data['currentPay'] = this.currentPay;
    data['basicPay'] = this.basicPay;
    data['houseRent'] = this.houseRent;
    data['utility'] = this.utility;
    data['workingDays'] = this.workingDays;
    data['ratePerDay'] = this.ratePerDay;
    data['earnedPay'] = this.earnedPay;
    data['arrears'] = this.arrears;
    data['netSalary'] = this.netSalary;
    data['netPayAble'] = this.netPayAble;
    return data;
  }



 
}