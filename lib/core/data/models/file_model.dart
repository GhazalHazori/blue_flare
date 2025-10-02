import 'package:blue_flare/core/enums/file_type_enum.dart';

class FileModel {
  FileTypeEnum type;
  String path;
  FileModel(this.path, this.type);
}
