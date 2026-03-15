// This is a mockup/scaffold of a dynamic form generator in Flutter context
// In a real integration, this would use Flutter widgets.

/*
import 'package:flutter/material.dart';
import '../../../mcp/models.dart';

class DynamicToolForm extends StatefulWidget {
  final ToolDescriptor descriptor;
  final Function(Map<String, dynamic>) onInvoke;

  const DynamicToolForm({
    super.key, 
    required this.descriptor, 
    required this.onInvoke
  });

  @override
  State<DynamicToolForm> createState() => _DynamicToolFormState();
}

class _DynamicToolFormState extends State<DynamicToolForm> {
  final Map<String, dynamic> _formData = {};

  @override
  Widget build(BuildContext context) {
    final schema = widget.descriptor.inputSchema;
    final properties = schema['properties'] as Map<String, dynamic>? ?? {};

    return Column(
      children: [
        Text(widget.descriptor.description, style: Theme.of(context).textTheme.bodySmall),
        const SizedBox(height: 16),
        ...properties.entries.map((e) => _buildField(e.key, e.value)),
        ElevatedButton(
          onPressed: () => widget.onInvoke(_formData),
          child: const Text('Invoke Tool'),
        ),
      ],
    );
  }

  Widget _buildField(String key, Map<String, dynamic> spec) {
    final type = spec['type'] as String?;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        decoration: InputDecoration(
          labelText: key,
          helperText: spec['description'] as String?,
        ),
        onChanged: (val) {
          if (type == 'number' || type == 'integer') {
            _formData[key] = num.tryParse(val);
          } else {
            _formData[key] = val;
          }
        },
      ),
    );
  }
}
*/
