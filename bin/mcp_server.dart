import 'dart:io';
import 'package:path/path.dart' as p;
import 'package:apidash_mcp_server/mcp_server/server.dart';

void main(List<String> args) async {
  String? hivePath;

  // 1. Check command line arguments for --hive-path flag
  for (int i = 0; i < args.length; i++) {
    if (args[i] == '--hive-path' && i + 1 < args.length) {
      hivePath = args[i + 1];
      break;
    } else if (args[i].startsWith('--hive-path=')) {
      hivePath = args[i].substring('--hive-path='.length);
      break;
    }
  }

  // Strip quotes if present (e.g. --hive-path="C:\path")
  if (hivePath != null && hivePath!.startsWith('"') && hivePath!.endsWith('"')) {
    hivePath = hivePath!.substring(1, hivePath!.length - 1);
  }

  // 2. Fallback to first positional argument (legacy support)
  hivePath ??= (args.isNotEmpty && !args[0].startsWith('--')) ? args[0] : null;

  // 3. Fallback to environment variable
  hivePath ??= Platform.environment['APIDASH_HIVE_PATH'];

  // 4. Default to a platform-specific user directory if still null
  if (hivePath == null) {
    final homeDir = Platform.environment['HOME'] ?? Platform.environment['USERPROFILE'] ?? '.';
    hivePath = p.join(homeDir, '.apidash');
    
    // Create the directory if it doesn't exist
    final dir = Directory(hivePath);
    if (!await dir.exists()) {
      await dir.create(recursive: true);
    }
  }

  stderr.writeln('Starting API Dash MCP Server...');
  stderr.writeln('Using Hive Path: ${Directory(hivePath).absolute.path}');

  final server = ApidashMcpServer(hivePath: hivePath);
  await server.run();
}
