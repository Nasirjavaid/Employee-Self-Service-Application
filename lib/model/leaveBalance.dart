class LeaveBalance {
  int id;
  int annualEntitlement;
  int casualEntitlement;
  int medicalEntitlement;
  int annualAvailed;
  int casualAvailed;
  int medicalAvailed;
  int annualBalance;
  int casualBalance;
  int medicalBalance;

  LeaveBalance(
      {this.id,
      this.annualEntitlement,
      this.casualEntitlement,
      this.medicalEntitlement,
      this.annualAvailed,
      this.casualAvailed,
      this.medicalAvailed,
      this.annualBalance,
      this.casualBalance,
      this.medicalBalance});

  LeaveBalance.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    annualEntitlement = json['annualEntitlement'];
    casualEntitlement = json['casualEntitlement'];
    medicalEntitlement = json['medicalEntitlement'];
    annualAvailed = json['annualAvailed'];
    casualAvailed = json['casualAvailed'];
    medicalAvailed = json['medicalAvailed'];
    annualBalance = json['annualBalance'];
    casualBalance = json['casualBalance'];
    medicalBalance = json['medicalBalance'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['annualEntitlement'] = this.annualEntitlement;
    data['casualEntitlement'] = this.casualEntitlement;
    data['medicalEntitlement'] = this.medicalEntitlement;
    data['annualAvailed'] = this.annualAvailed;
    data['casualAvailed'] = this.casualAvailed;
    data['medicalAvailed'] = this.medicalAvailed;
    data['annualBalance'] = this.annualBalance;
    data['casualBalance'] = this.casualBalance;
    data['medicalBalance'] = this.medicalBalance;
    return data;
  }
}