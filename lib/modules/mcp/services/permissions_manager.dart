import 'dart:async';
import '../mcp/models.dart';

class McpPermissionsManager {
  final Set<String> _approvedTools = {};
  
  bool isToolApproved(String toolName) {
    return _approvedTools.contains(toolName);
  }

  Future<bool> requestPermission(String toolName, ToolDescriptor descriptor) async {
    final uiMeta = descriptor.uiMeta;
    
    // Auto-approve if not destructive and no risky permissions
    if (uiMeta?.isDestructive != true && uiMeta?.permissions?.needsFileSystem != true) {
      _approvedTools.add(toolName);
      return true;
    }

    // In a real app, this would show a dialog. 
    // For now, we simulate user approval or block by default for safety.
    return _approvedTools.contains(toolName);
  }

  void approveTool(String toolName) {
    _approvedTools.add(toolName);
  }

  void revokeTool(String toolName) {
    _approvedTools.remove(toolName);
  }
}
