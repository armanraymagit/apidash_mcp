import 'dart:io';
import 'package:args/args.dart';
import '../lib/mcp/server_core.dart';
import '../lib/mcp/transport.dart';
import '../lib/mcp_server/server.dart';

void main(List<String> arguments) async {
  final parser = ArgParser()
    ..addFlag('help', abbr: 'h', negatable: false, help: 'Show usage information')
    ..addOption('hive-path', help: 'Path to API Dash Hive boxes', defaultsTo: '.');

  final results = parser.parse(arguments);

  if (results['help']) {
    print('API Dash MCP CLI');
    print('Usage: dart bin/apidash_mcp.dart [options]');
    print(parser.usage);
    exit(0);
  }

  final hivePath = results['hive-path'];
  
  print('Starting API Dash MCP Server...');
  print('Hive Path: $hivePath');

  try {
    final server = ApidashMcpServer(hivePath: hivePath);
    await server.run();
  } catch (e) {
    stderr.writeln('Error starting server: $e');
    exit(1);
  }
}
