class ProductsModel {
  bool? success;
  String? message;
  List<Data>? data;

  ProductsModel({this.success, this.message, this.data});

  ProductsModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? id;
  String? name;
  String? description;
  double? price;
  int? stock;
  String? category;
  String? image;
  String? userId;
  String? brand;
  bool? isDiscounted;
  int? discountPercent;
  List<String>? tags;
  bool? isActive;
  double? weight;
  List<String>? colors;
  String? dimensions;
  String? createdAt;
  String? updatedAt;
  User? user;

  Data(
      {this.id,
      this.name,
      this.description,
      this.price,
      this.stock,
      this.category,
      this.image,
      this.userId,
      this.brand,
      this.isDiscounted,
      this.discountPercent,
      this.tags,
      this.isActive,
      this.weight,
      this.colors,
      this.dimensions,
      this.createdAt,
      this.updatedAt,
      this.user});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    stock = json['stock'];
    category = json['category'];
    image = json['image'];
    userId = json['userId'];
    brand = json['brand'];
    isDiscounted = json['isDiscounted'];
    discountPercent = json['discountPercent'];
    tags = json['tags'].cast<String>();
    isActive = json['isActive'];
    weight = json['weight'];
    colors = json['colors'].cast<String>();
    dimensions = json['dimensions'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['price'] = this.price;
    data['stock'] = this.stock;
    data['category'] = this.category;
    data['image'] = this.image;
    data['userId'] = this.userId;
    data['brand'] = this.brand;
    data['isDiscounted'] = this.isDiscounted;
    data['discountPercent'] = this.discountPercent;
    data['tags'] = this.tags;
    data['isActive'] = this.isActive;
    data['weight'] = this.weight;
    data['colors'] = this.colors;
    data['dimensions'] = this.dimensions;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
  String? id;
  String? fullName;
  String? email;
  String? profileImage;
  String? country;
  String? role;
  String? status;
  String? createdAt;
  String? updatedAt;

  User(
      {this.id,
      this.fullName,
      this.email,
      this.profileImage,
      this.country,
      this.role,
      this.status,
      this.createdAt,
      this.updatedAt});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['fullName'];
    email = json['email'];
    profileImage = json['profileImage'];
    country = json['country'];
    role = json['role'];
    status = json['status'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['fullName'] = this.fullName;
    data['email'] = this.email;
    data['profileImage'] = this.profileImage;
    data['country'] = this.country;
    data['role'] = this.role;
    data['status'] = this.status;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
