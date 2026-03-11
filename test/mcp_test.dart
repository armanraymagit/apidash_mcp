import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:test/test.dart';

void main() {
  test('MCP server full test', () async {
    // Create a temporary directory for testing hive path
    final tempHiveDir = Directory.systemTemp.createTempSync('apidash_mcp_test_');
    
    final process = await Process.start(
      Platform.executable,
      ['bin/mcp_server.dart', '--hive-path', tempHiveDir.path],
    );

    final responses = StreamController<Map<String, dynamic>>.broadcast();
    process.stdout
        .transform(utf8.decoder)
        .transform(const LineSplitter())
        .listen((line) {
      final jsonStart = line.indexOf('{');
      if (jsonStart != -1) {
        try {
          final jsonStr = line.substring(jsonStart);
          responses.add(jsonDecode(jsonStr));
        } catch (e) {
          stderr.writeln('JSON Decode Error: $e in $line');
        }
      } else {
        stderr.writeln('STDOUT: $line');
      }
    });

    Future<Map<String, dynamic>> nextResponse(int id) {
      return responses.stream.firstWhere((r) => r['id'] == id).timeout(const Duration(seconds: 10));
    }

    // 1. Ping
    process.stdin.writeln(jsonEncode({'jsonrpc': '2.0', 'method': 'ping', 'id': 1}));
    final resp1 = await nextResponse(1);
    expect(resp1['result']['ok'], true);

    // 2. List Resources
    process.stdin.writeln(jsonEncode({'jsonrpc': '2.0', 'method': 'listResources', 'id': 2}));
    final resp2 = await nextResponse(2);
    expect(resp2['result'], isA<List>());
    print('Found ${resp2['result'].length} resources');

    // 3. Invoke Tool (status)
    process.stdin.writeln(jsonEncode({
      'jsonrpc': '2.0',
      'method': 'invokeTool',
      'params': {'name': 'status', 'parameters': {}},
      'id': 3
    }));
    final resp3 = await nextResponse(3);
    expect(resp3['result']['result']['status'], 'connected');

    process.kill();
    await responses.close();
    
    // Cleanup temporary directory
    if (tempHiveDir.existsSync()) {
      await tempHiveDir.delete(recursive: true);
    }
  });
}
