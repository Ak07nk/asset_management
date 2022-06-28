import 'dart:convert';

//*********************************************************************************** */
class ConstructionAssetRequest {
  String? astName;
  String? astDesc;
  String? astCat;
  int? astQty;
  String? astCondition;
  String? astRemarks;
  int? createdBy;
  String? astWard;
  String? astprdate;
  String? astimage;
  String? astaddress;
  String? astpincode;
  String? astconsstage;
  ConstructionAssetRequest(
      {this.astName,
      this.astDesc,
      this.astCat,
      this.astQty,
      this.astCondition,
      this.astRemarks,
      this.createdBy,
      this.astWard,
      this.astprdate,
      this.astaddress,
      this.astpincode,
      this.astconsstage,
      this.astimage});

  ConstructionAssetRequest copyWith(
      {String? astName,
      String? astDesc,
      String? astCat,
      int? astQty,
      String? astCondition,
      String? astRemarks,
      int? createdBy,
      String? astWard,
      String? astprdate,
      String? astimage,
      String? astaddress,
      String? astconsstage,
      String? astpincode}) {
    return ConstructionAssetRequest(
      astName: astName ?? this.astName,
      astDesc: astDesc ?? this.astDesc,
      astCat: astCat ?? this.astCat,
      astQty: astQty ?? this.astQty,
      astCondition: astCondition ?? this.astCondition,
      astRemarks: astRemarks ?? this.astRemarks,
      createdBy: createdBy ?? this.createdBy,
      astWard: astWard ?? this.astWard,
      astprdate: astprdate ?? this.astprdate,
      astimage: astimage ?? this.astimage,
      astaddress: astaddress ?? this.astaddress,
      astconsstage: astconsstage ?? this.astconsstage,
      astpincode: astpincode ?? this.astpincode,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (astName != null) {
      result.addAll({'ast_name': astName});
    }
    if (astDesc != null) {
      result.addAll({'ast_desc': astDesc});
    }
    if (astCat != null) {
      result.addAll({'ast_cat': astCat});
    }
    if (astQty != null) {
      result.addAll({'ast_qty': astQty});
    }
    if (astCondition != null) {
      result.addAll({'ast_condition': astCondition});
    }
    if (astRemarks != null) {
      result.addAll({'ast_remarks': astRemarks});
    }
    if (createdBy != null) {
      result.addAll({'created_by': createdBy});
    }
    if (astWard != null) {
      result.addAll({'ast_ward': astWard});
    }
    if (astprdate != null) {
      result.addAll({'ast_pr_date': astprdate});
    }
    if (astimage != null) {
      result.addAll({'ast_image': astimage});
    }
    if (astaddress != null) {
      result.addAll({'ast_address': astaddress});
    }
    if (astconsstage != null) {
      result.addAll({'ast_cons_stage': astconsstage});
    }
    if (astpincode != null) {
      result.addAll({'ast_pincode': astpincode});
    }

    return result;
  }

  factory ConstructionAssetRequest.fromMap(Map<String, dynamic> map) {
    return ConstructionAssetRequest(
      astName: map['ast_name'],
      astDesc: map['ast_desc'],
      astCat: map['ast_cat'],
      astQty: map['ast_qty']?.toInt(),
      astCondition: map['ast_condition'],
      astRemarks: map['ast_remarks'],
      createdBy: map['created_by']?.toInt(),
      astWard: map['ast_ward'],
      astprdate: map['ast_pr_date'],
      astimage: map['ast_image'],
      astaddress: map['ast_address'],
      astpincode: map['ast_pincode'],
      astconsstage: map['ast_cons_stage'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ConstructionAssetRequest.fromJson(String source) =>
      ConstructionAssetRequest.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ConstructionAssetRequest(ast_name: $astName, ast_desc: $astDesc, ast_cat: $astCat, ast_qty: $astQty, ast_condition: $astCondition, ast_remarks: $astRemarks, created_by: $createdBy, ast_ward: $astWard,ast_pr_date: $astprdate,ast_image:$astimage,ast_address:$astaddress,ast_cons_stage:$astconsstage, ast_pincode:$astpincode)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ConstructionAssetRequest &&
        other.astName == astName &&
        other.astDesc == astDesc &&
        other.astCat == astCat &&
        other.astQty == astQty &&
        other.astCondition == astCondition &&
        other.astRemarks == astRemarks &&
        other.createdBy == createdBy &&
        other.astWard == astWard &&
        other.astprdate == astprdate &&
        other.astimage == astimage &&
        other.astaddress == astaddress &&
        other.astconsstage == astconsstage &&
        other.astpincode == astpincode;
  }

  @override
  int get hashCode {
    return astName.hashCode ^
        astDesc.hashCode ^
        astCat.hashCode ^
        astQty.hashCode ^
        astCondition.hashCode ^
        astRemarks.hashCode ^
        createdBy.hashCode ^
        astWard.hashCode ^
        astprdate.hashCode ^
        astimage.hashCode ^
        astaddress.hashCode ^
        astconsstage.hashCode ^
        astpincode.hashCode;
  }
}

// *********************************************************************************** *//
class ConstructionAssetRespond {
  bool? status;
  String? message;
  ConstructionAssetRespond({
    this.status,
    this.message,
  });

  ConstructionAssetRespond copyWith({
    bool? status,
    String? message,
  }) {
    return ConstructionAssetRespond(
      status: status ?? this.status,
      message: message ?? this.message,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (status != null) {
      result.addAll({'status': status});
    }
    if (message != null) {
      result.addAll({'message': message});
    }

    return result;
  }

  factory ConstructionAssetRespond.fromMap(Map<String, dynamic> map) {
    return ConstructionAssetRespond(
      status: map['status'],
      message: map['message'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ConstructionAssetRespond.fromJson(String source) =>
      ConstructionAssetRespond.fromMap(json.decode(source));

  @override
  String toString() =>
      'ConstructionAssetRespond(status: $status, message: $message)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ConstructionAssetRespond &&
        other.status == status &&
        other.message == message;
  }

  @override
  int get hashCode => status.hashCode ^ message.hashCode;
}
