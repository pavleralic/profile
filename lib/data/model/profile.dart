class Profile {
  Profile(
      {required this.id,
        required this.profilePicturePath,
        required this.profilePictureUploadDate});

  final int id;
  final String? profilePicturePath;
  final String? profilePictureUploadDate;

  Profile.fromJson(Map<String, dynamic> json)
      : this.id = json['id'],
        this.profilePicturePath = json['profilePicturePath'],
        this.profilePictureUploadDate = json['profilePictureUploadDate'];
}
