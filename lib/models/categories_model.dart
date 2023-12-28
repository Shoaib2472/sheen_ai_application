// To parse this JSON data, do
//
//     final categoriesModel = categoriesModelFromJson(jsonString);

import 'dart:convert';

CategoriesModel categoriesModelFromJson(String str) => CategoriesModel.fromJson(json.decode(str));

String categoriesModelToJson(CategoriesModel data) => json.encode(data.toJson());

class CategoriesModel {
    final bool? success;
    final Data? data;
    final String? message;
    final String? requestId;

    CategoriesModel({
        this.success,
        this.data,
        this.message,
        this.requestId,
    });

    factory CategoriesModel.fromJson(Map<String, dynamic> json) => CategoriesModel(
        success: json["success"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
        message: json["message"],
        requestId: json["requestId"],
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "data": data?.toJson(),
        "message": message,
        "requestId": requestId,
    };
}

class Data {
    final List<Record>? records;
    final PaginationInfo? paginationInfo;

    Data({
        this.records,
        this.paginationInfo,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        records: json["records"] == null ? [] : List<Record>.from(json["records"]!.map((x) => Record.fromJson(x))),
        paginationInfo: json["paginationInfo"] == null ? null : PaginationInfo.fromJson(json["paginationInfo"]),
    );

    Map<String, dynamic> toJson() => {
        "records": records == null ? [] : List<dynamic>.from(records!.map((x) => x.toJson())),
        "paginationInfo": paginationInfo?.toJson(),
    };
}

class PaginationInfo {
    final int? currentPageNo;
    final int? perPageRecords;
    final int? totalPages;
    final int? totalRecords;

    PaginationInfo({
        this.currentPageNo,
        this.perPageRecords,
        this.totalPages,
        this.totalRecords,
    });

    factory PaginationInfo.fromJson(Map<String, dynamic> json) => PaginationInfo(
        currentPageNo: json["currentPageNo"],
        perPageRecords: json["perPageRecords"],
        totalPages: json["totalPages"],
        totalRecords: json["totalRecords"],
    );

    Map<String, dynamic> toJson() => {
        "currentPageNo": currentPageNo,
        "perPageRecords": perPageRecords,
        "totalPages": totalPages,
        "totalRecords": totalRecords,
    };
}

class Record {
    final int? quantity;
    final bool? imageFlag;
    final Category? collectionLine;
    final Category? category;
    final Category? subCategory;
    final double? grossWeight;
    final double? netWeight;
    final dynamic division;
    final CreatedBy? createdBy;
    final dynamic size;
    final dynamic color;
    final Purity? purity;
    final List<dynamic>? diamondDetails;
    final String? vendorCode;
    final String? code;
    final String? id;
    final String? styleNo;
    final double? jewelPrice;

    Record({
        this.quantity,
        this.imageFlag,
        this.collectionLine,
        this.category,
        this.subCategory,
        this.grossWeight,
        this.netWeight,
        this.division,
        this.createdBy,
        this.size,
        this.color,
        this.purity,
        this.diamondDetails,
        this.vendorCode,
        this.code,
        this.id,
        this.styleNo,
        this.jewelPrice,
    });

    factory Record.fromJson(Map<String, dynamic> json) => Record(
        quantity: json["quantity"],
        imageFlag: json["imageFlag"],
        collectionLine: json["collectionLine"] == null ? null : Category.fromJson(json["collectionLine"]),
        category: json["category"] == null ? null : Category.fromJson(json["category"]),
        subCategory: json["subCategory"] == null ? null : Category.fromJson(json["subCategory"]),
        grossWeight: json["grossWeight"]?.toDouble(),
        netWeight: json["netWeight"]?.toDouble(),
        division: json["division"],
        createdBy: json["createdBy"] == null ? null : CreatedBy.fromJson(json["createdBy"]),
        size: json["size"],
        color: json["color"],
        purity: json["purity"] == null ? null : Purity.fromJson(json["purity"]),
        diamondDetails: json["diamondDetails"] == null ? [] : List<dynamic>.from(json["diamondDetails"]!.map((x) => x)),
        vendorCode: json["vendorCode"],
        code: json["code"],
        id: json["_id"],
        styleNo: json["styleNo"],
        jewelPrice: json["jewelPrice"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "quantity": quantity,
        "imageFlag": imageFlag,
        "collectionLine": collectionLine?.toJson(),
        "category": category?.toJson(),
        "subCategory": subCategory?.toJson(),
        "grossWeight": grossWeight,
        "netWeight": netWeight,
        "division": division,
        "createdBy": createdBy?.toJson(),
        "size": size,
        "color": color,
        "purity": purity?.toJson(),
        "diamondDetails": diamondDetails == null ? [] : List<dynamic>.from(diamondDetails!.map((x) => x)),
        "vendorCode": vendorCode,
        "code": code,
        "_id": id,
        "styleNo": styleNo,
        "jewelPrice": jewelPrice,
    };
}

class Category {
    final String? name;
    final String? id;

    Category({
        this.name,
        this.id,
    });

    factory Category.fromJson(Map<String, dynamic> json) => Category(
        name: json["name"],
        id: json["_id"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "_id": id,
    };
}

class CreatedBy {
    final Id? id;
    final FirstName? firstName;
    final LastName? lastName;

    CreatedBy({
        this.id,
        this.firstName,
        this.lastName,
    });

    factory CreatedBy.fromJson(Map<String, dynamic> json) => CreatedBy(
        id: idValues.map[json["_id"]]!,
        firstName: firstNameValues.map[json["firstName"]]!,
        lastName: lastNameValues.map[json["lastName"]]!,
    );

    Map<String, dynamic> toJson() => {
        "_id": idValues.reverse[id],
        "firstName": firstNameValues.reverse[firstName],
        "lastName": lastNameValues.reverse[lastName],
    };
}

enum FirstName {
    VITTAL
}

final firstNameValues = EnumValues({
    "Vittal": FirstName.VITTAL
});

enum Id {
    THE_6537949_E56_A2_D2000_B0_A42_F4
}

final idValues = EnumValues({
    "6537949e56a2d2000b0a42f4": Id.THE_6537949_E56_A2_D2000_B0_A42_F4
});

enum LastName {
    WHITEFIRE_ADMIN
}

final lastNameValues = EnumValues({
    "Whitefire Admin": LastName.WHITEFIRE_ADMIN
});

class Purity {
    final int? value;
    final double? percent;

    Purity({
        this.value,
        this.percent,
    });

    factory Purity.fromJson(Map<String, dynamic> json) => Purity(
        value: json["value"],
        percent: json["percent"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "value": value,
        "percent": percent,
    };
}

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
