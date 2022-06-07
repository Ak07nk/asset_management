import 'dart:convert';

//*********************************************************************************** */
class AssestInsertRequest {
  String? astName;
  String? astDesc;
  int? astCat;
  int? astQty;
  String? astCondition;
  String? astRemarks;
  int? createdBy;
  int? astWard;
  String? astprdate;
  String? astimage;
  AssestInsertRequest(
      {this.astName,
      this.astDesc,
      this.astCat,
      this.astQty,
      this.astCondition,
      this.astRemarks,
      this.createdBy,
      this.astWard,
      this.astprdate,
      this.astimage});

  AssestInsertRequest copyWith(
      {String? astName,
      String? astDesc,
      int? astCat,
      int? astQty,
      String? astCondition,
      String? astRemarks,
      int? createdBy,
      int? astWard,
      String? astprdate,
      String? astimage}) {
    return AssestInsertRequest(
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

    return result;
  }

  factory AssestInsertRequest.fromMap(Map<String, dynamic> map) {
    return AssestInsertRequest(
      astName: map['ast_name'],
      astDesc: map['ast_desc'],
      astCat: map['ast_cat']?.toInt(),
      astQty: map['ast_qty']?.toInt(),
      astCondition: map['ast_condition'],
      astRemarks: map['ast_remarks'],
      createdBy: map['created_by']?.toInt(),
      astWard: map['ast_ward']?.toInt(),
      astprdate: map['ast_pr_date']?.toInt(),
      astimage: map['ast_image']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory AssestInsertRequest.fromJson(String source) =>
      AssestInsertRequest.fromMap(json.decode(source));

  @override
  String toString() {
    return 'AssestInsertRequest(ast_name: $astName, ast_desc: $astDesc, ast_cat: $astCat, ast_qty: $astQty, ast_condition: $astCondition, ast_remarks: $astRemarks, created_by: $createdBy, ast_ward: $astWard,ast_pr_date: $astprdate,ast_image:$astimage)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AssestInsertRequest &&
        other.astName == astName &&
        other.astDesc == astDesc &&
        other.astCat == astCat &&
        other.astQty == astQty &&
        other.astCondition == astCondition &&
        other.astRemarks == astRemarks &&
        other.createdBy == createdBy &&
        other.astWard == astWard &&
        other.astprdate == astprdate &&
        other.astimage == astimage;
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
        astimage.hashCode;
  }
}

// *********************************************************************************** *//
class AssestInsertRespond {
  bool? status;
  String? message;
  AssestInsertRespond({
    this.status,
    this.message,
  });

  AssestInsertRespond copyWith({
    bool? status,
    String? message,
  }) {
    return AssestInsertRespond(
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

  factory AssestInsertRespond.fromMap(Map<String, dynamic> map) {
    return AssestInsertRespond(
      status: map['status'],
      message: map['message'],
    );
  }

  String toJson() => json.encode(toMap());

  factory AssestInsertRespond.fromJson(String source) =>
      AssestInsertRespond.fromMap(json.decode(source));

  @override
  String toString() =>
      'AssestInsertRespond(status: $status, message: $message)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AssestInsertRespond &&
        other.status == status &&
        other.message == message;
  }

  @override
  int get hashCode => status.hashCode ^ message.hashCode;
}
