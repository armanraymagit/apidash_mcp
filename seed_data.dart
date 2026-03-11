import 'dart:io';
import 'package:hive_ce/hive.dart';
import 'package:path/path.dart' as p;

void main(List<String> args) async {
  final hivePath = args.isNotEmpty ? args[0] : 'E:\\';
  print('Seeding sample data into Hive boxes at: $hivePath');

  // We seed directly into the source Hive files
  Hive.init(hivePath);

  final dataBox = await Hive.openBox('apidash-data');
  final envBox = await Hive.openBox('apidash-environments');
  final historyBox = await Hive.openBox('apidash-history-meta');
  final historyLazyBox = await Hive.openBox('apidash-history-lazy');

  // 1. Seed Requests
  final reqId1 = 'req-demo-1';
  final reqId2 = 'req-demo-2';
  
  await dataBox.put('ids', [reqId1, reqId2]);
  await dataBox.put(reqId1, {
    'id': reqId1,
    'name': 'GET User Profile',
    'method': 'get',
    'url': 'https://api.example.com/user/1',
  });
  await dataBox.put(reqId2, {
    'id': reqId2,
    'name': 'POST Login',
    'method': 'post',
    'url': 'https://api.example.com/login',
  });

  // 2. Seed Environments
  final envId = 'env-demo-1';
  await envBox.put('environmentIds', [envId]);
  await envBox.put(envId, {
    'id': envId,
    'name': 'Production',
    'values': [
      {'key': 'baseUrl', 'value': 'https://api.myapp.com'},
      {'key': 'apiKey', 'value': 'secret_key_123'},
    ],
  });

  // 3. Seed History
  final histId = 'hist-demo-1';
  final now = DateTime.now().millisecondsSinceEpoch;
  await historyBox.put('historyIds', [histId]);
  await historyBox.put(histId, {
    'id': histId,
    'timestamp': now,
    'requestId': reqId1,
  });
  await historyLazyBox.put(histId, {
    'id': histId,
    'responseCode': 200,
    'responseBody': '{"status": "success", "user": "John Doe"}',
  });

  print('Successfully seeded 2 requests, 1 environment, and 1 history item.');
  await Hive.close();
}
