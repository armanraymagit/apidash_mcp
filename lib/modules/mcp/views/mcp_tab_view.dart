// This is a mockup/scaffold of the MCP Management Tab in Flutter context

/*
import 'package:flutter/material.dart';
import '../services/permissions_manager.dart';
import '../widgets/dynamic_tool_form.dart';
import '../../mcp/client_core.dart';

class McpTabView extends StatefulWidget {
  const McpTabView({super.key});

  @override
  State<McpTabView> createState() => _McpTabViewState();
}

class _McpTabViewState extends State<McpTabView> {
  final List<String> _connectedServers = ['Internal API Dash Server'];
  String? _selectedServer;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Sidebar for servers
        ServerList(
          servers: _connectedServers, 
          onSelect: (s) => setState(() => _selectedServer = s)
        ),
        const VerticalDivider(),
        // Main view for tools and resources
        Expanded(
          child: _selectedServer == null 
            ? const Center(child: Text('Select a server to manage tools'))
            : ToolResourceBrowser(serverName: _selectedServer!)
        ),
      ],
    );
  }
}

class ServerList extends StatelessWidget {
  final List<String> servers;
  final Function(String) onSelect;
  const ServerList({super.key, required this.servers, required this.onSelect});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: ListView(
        children: [
          const ListTile(title: Text('MCP SERVERS', style: TextStyle(fontWeight: FontWeight.bold))),
          ...servers.map((s) => ListTile(
            title: Text(s),
            onTap: () => onSelect(s),
          )),
          ListTile(
            leading: const Icon(Icons.add),
            title: const Text('Add External'),
            onTap: () { /* Show add dialog */ },
          ),
        ],
      ),
    );
  }
}

class ToolResourceBrowser extends StatelessWidget {
  final String serverName;
  const ToolResourceBrowser({super.key, required this.serverName});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          const TabBar(
            tabs: [Tab(text: 'Tools'), Tab(text: 'Resources')],
          ),
          Expanded(
            child: TabBarView(
              children: [
                _buildToolsList(),
                const Center(child: Text('Resource Browser (Tree View)')),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildToolsList() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Card(
          child: ListTile(
            title: const Text('List Files'),
            subtitle: const Text('List files in a directory'),
            trailing: const Icon(Icons.play_arrow),
            onTap: () { /* Open Tool Runner UI */ },
          ),
        ),
      ],
    );
  }
}
*/
