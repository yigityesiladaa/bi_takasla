import 'dart:io';
import 'package:bitakasla/core/base/base_getx_service.dart';
import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:path_provider/path_provider.dart';

class CacheService extends BaseGetxService {
  String? localPath;

  Future<bool> save({required GetStorage box, required String key, required dynamic value}) async {
    bool? error;
    try {
      await box.write(key, value);
    } catch (e) {
      error = true;
      logger.e(e);
    }
    return error == null;
  }

  Future<void> setLocalPath() async {
    localPath ??= (await getApplicationDocumentsDirectory()).path;
  }

  Future<bool> downloadData(
      {required String url, required String jsonName, Object? data, Map<String, dynamic>? headers}) async {
    try {
      await setLocalPath();

      var fileResult = await _downloadFile(
        url: url,
        filename: '$localPath/assets/app_contents/$jsonName',
        data: data,
        headers: headers,
      );

      logger.d('FİNİSH DOWNLOAD');
      return fileResult != null;
    } catch (e) {
      logger.e(e);
      return false;
    }
  }

  Future<File?> _downloadFile({
    required String url,
    required String filename,
    Object? data,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final response = await dio.post(
        url,
        data: data,
        options: Options(headers: headers),
      );

      return response.statusCode != 200 ? null : _saveFile(filename: filename, contents: response.data.toString());
    } catch (e) {
      logger.e(e);
      return null;
    }
  }

  Future<File> _saveFile({required String filename, required String contents}) async {
    final file = File(filename);
    if (!await file.exists()) {
      await file.create(recursive: true);
    }
    await file.writeAsString(contents, flush: true);
    return file;
  }

  dynamic getData<T>({required GetStorage box, required String key}) {
    return box.read<T>(key);
  }

  Future<void> deleteData({required GetStorage box, required String key}) async {
    try {
      await box.remove(key);
    } catch (e) {
      logger.e(e);
    }
  }
}
