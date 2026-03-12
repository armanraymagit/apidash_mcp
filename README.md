# API Dash MCP Server

The API Dash MCP (Model Context Protocol) Server allows AI agents (like Claude) to interact with API Dash collections, environments, and history

### Default Path

Check out the [MCP Support Video](https://github.com/armanraymagit/apidash_mcp/blob/bf18d0422ac0aacd91f50ffed7afa8c6c5465c9c/MCP%20Support%20video.mp4) to see the server in action.

## Integration with Claude Desktop

To use this server with Claude Desktop, add it to your `claude_desktop_config.json` file. 

**Note:** You must provide the **absolute path** to both the `dart` executable (if not in PATH) and the `mcp_server.dart` file.

```json
{
  "mcpServers": {
    "apidash": {
      "command": "dart",
      "args": [
        "C:\\path\\to\\apidash_mcp_server\\bin\\mcp_server.dart",
        "--hive-path",
        "C:\\Users\\YourUser\\Documents\\apidash"
      ]
    }
  }
}
```

### Finding your Hive Path
In the API Dash desktop application, your workspace path is the directory where your collections are saved. You can find or change this in the app's settings.

## Features

- **Resources**: Lists and provides access to your API requests and environment configurations.
- **Tools**:
    - `get_request_details`: Fetch full details (URL, headers, body) of any request.
    - `get_environment_variables`: Access variables from your defined environments.
    - `status`: Check the server connection and total request count.
