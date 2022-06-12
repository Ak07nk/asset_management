import 'dart:convert';

import 'package:flutter/foundation.dart';

class ReportResponse {
  bool? status;
  Data? data;
  ReportResponse({
    this.status,
    this.data,
  });

  ReportResponse copyWith({
    bool? status,
    Data? data,
  }) {
    return ReportResponse(
      status: status ?? this.status,
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (status != null) {
      result.addAll({'status': status});
    }
    if (data != null) {
      result.addAll({'data': data!.toMap()});
    }

    return result;
  }

  factory ReportResponse.fromMap(Map<String, dynamic> map) {
    return ReportResponse(
      status: map['status'],
      data: map['data'] != null ? Data.fromMap(map['data']) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ReportResponse.fromJson(String source) =>
      ReportResponse.fromMap(json.decode(source));

  @override
  String toString() => 'ReportResponse(status: $status, data: $data)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ReportResponse &&
        other.status == status &&
        other.data == data;
  }

  @override
  int get hashCode => status.hashCode ^ data.hashCode;
}

class Data {
  int? totalRows;
  List<Reports>? reports;
  Data({
    this.totalRows,
    this.reports,
  });

  Data copyWith({
    int? totalRows,
    List<Reports>? reports,
  }) {
    return Data(
      totalRows: totalRows ?? this.totalRows,
      reports: reports ?? this.reports,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (totalRows != null) {
      result.addAll({'totalRows': totalRows});
    }
    if (reports != null) {
      result.addAll({'reports': reports!.map((x) => x.toMap()).toList()});
    }

    return result;
  }

  factory Data.fromMap(Map<String, dynamic> map) {
    return Data(
      totalRows: map['totalRows']?.toInt(),
      reports: map['reports'] != null
          ? List<Reports>.from(map['reports']?.map((x) => Reports.fromMap(x)))
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Data.fromJson(String source) => Data.fromMap(json.decode(source));

  @override
  String toString() => 'Data(totalRows: $totalRows, reports: $reports)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Data &&
        other.totalRows == totalRows &&
        listEquals(other.reports, reports);
  }

  @override
  int get hashCode => totalRows.hashCode ^ reports.hashCode;
}

class Reports {
  String? id;
  String? astName;
  String? astDesc;
  String? astCat;
  String? astQty;
  String? astCondition;
  String? astImage;
  String? astRemarks;
  String? createdBy;
  String? astWard;
  String? created;
  String? modified;
  String? astPrDate;
  Reports({
    this.id,
    this.astName,
    this.astDesc,
    this.astCat,
    this.astQty,
    this.astCondition,
    this.astImage,
    this.astRemarks,
    this.createdBy,
    this.astWard,
    this.created,
    this.modified,
    this.astPrDate,
  });

  Reports copyWith({
    String? id,
    String? astName,
    String? astDesc,
    String? astCat,
    String? astQty,
    String? astCondition,
    String? astImage,
    String? astRemarks,
    String? createdBy,
    String? astWard,
    String? created,
    String? modified,
    String? astPrDate,
  }) {
    return Reports(
      id: id ?? this.id,
      astName: astName ?? this.astName,
      astDesc: astDesc ?? this.astDesc,
      astCat: astCat ?? this.astCat,
      astQty: astQty ?? this.astQty,
      astCondition: astCondition ?? this.astCondition,
      astImage: astImage ?? this.astImage,
      astRemarks: astRemarks ?? this.astRemarks,
      createdBy: createdBy ?? this.createdBy,
      astWard: astWard ?? this.astWard,
      created: created ?? this.created,
      modified: modified ?? this.modified,
      astPrDate: astPrDate ?? this.astPrDate,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (id != null) {
      result.addAll({'id': id});
    }
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
    if (astImage != null) {
      result.addAll({'ast_image': astImage});
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
    if (created != null) {
      result.addAll({'created': created});
    }
    if (modified != null) {
      result.addAll({'modified': modified});
    }
    if (astPrDate != null) {
      result.addAll({'ast_pr_date': astPrDate});
    }

    return result;
  }

  factory Reports.fromMap(Map<String, dynamic> map) {
    return Reports(
      id: map['id'],
      astName: map['ast_name'],
      astDesc: map['ast_desc'],
      astCat: map['ast_cat'],
      astQty: map['ast_qty'],
      astCondition: map['ast_condition'],
      astImage: map['ast_image'],
      astRemarks: map['ast_remarks'],
      createdBy: map['created_by'],
      astWard: map['ast_ward'],
      created: map['created'],
      modified: map['modified'],
      astPrDate: map['ast_pr_date'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Reports.fromJson(String source) =>
      Reports.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Reports(id: $id, ast_name: $astName, ast_desc: $astDesc, ast_cat: $astCat, ast_qty: $astQty, ast_condition: $astCondition, ast_image: $astImage, ast_remarks: $astRemarks, created_by: $createdBy, ast_ward: $astWard, created: $created, modified: $modified, ast_pr_date: $astPrDate)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Reports &&
        other.id == id &&
        other.astName == astName &&
        other.astDesc == astDesc &&
        other.astCat == astCat &&
        other.astQty == astQty &&
        other.astCondition == astCondition &&
        other.astImage == astImage &&
        other.astRemarks == astRemarks &&
        other.createdBy == createdBy &&
        other.astWard == astWard &&
        other.created == created &&
        other.modified == modified &&
        other.astPrDate == astPrDate;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        astName.hashCode ^
        astDesc.hashCode ^
        astCat.hashCode ^
        astQty.hashCode ^
        astCondition.hashCode ^
        astImage.hashCode ^
        astRemarks.hashCode ^
        createdBy.hashCode ^
        astWard.hashCode ^
        created.hashCode ^
        modified.hashCode ^
        astPrDate.hashCode;
  }
}
