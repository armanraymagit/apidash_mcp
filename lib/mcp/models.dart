
class ResourceDescriptor {
  final String uri;
  final String name;
  final String? description;
  final String? mimeType;

  ResourceDescriptor({
    required this.uri,
    required this.name,
    this.description,
    this.mimeType,
  });

  factory ResourceDescriptor.fromJson(Map<String, dynamic> json) {
    return ResourceDescriptor(
      uri: json['uri'] as String,
      name: json['name'] as String? ?? '',
      description: json['description'] as String?,
      mimeType: json['mimeType'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uri': uri,
      'name': name,
      if (description != null) 'description': description,
      if (mimeType != null) 'mimeType': mimeType,
    };
  }
}

class Resource {
  final String uri;
  final String text;
  final String? mimeType;

  Resource({
    required this.uri,
    required this.text,
    this.mimeType,
  });

  Map<String, dynamic> toJson() {
    return {
      'uri': uri,
      'text': text,
      if (mimeType != null) 'mimeType': mimeType,
    };
  }
}

class ToolRequest {
  final String name;
  final Map<String, dynamic> parameters;

  ToolRequest({
    required this.name,
    required this.parameters,
  });

  factory ToolRequest.fromJson(Map<String, dynamic> json) {
    return ToolRequest(
      name: json['name'] as String,
      parameters: json['parameters'] as Map<String, dynamic>,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'parameters': parameters,
    };
  }
}

class ToolResponse {
  final dynamic result;
  final String? error;

  ToolResponse({
    this.result,
    this.error,
  });

  factory ToolResponse.fromJson(Map<String, dynamic> json) {
    return ToolResponse(
      result: json['result'],
      error: json['error'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (result != null) 'result': result,
      if (error != null) 'error': error,
    };
  }
}

class ToolDescriptor {
  final String name;
  final String description;
  final Map<String, dynamic> inputSchema;

  ToolDescriptor({
    required this.name,
    required this.description,
    required this.inputSchema,
  });

  factory ToolDescriptor.fromJson(Map<String, dynamic> json) {
    return ToolDescriptor(
      name: json['name'] as String,
      description: json['description'] as String,
      inputSchema: json['inputSchema'] as Map<String, dynamic>,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'inputSchema': inputSchema,
    };
  }
}
