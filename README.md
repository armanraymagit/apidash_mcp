# API Dash MCP Server

The API Dash MCP (Model Context Protocol) Server allows AI agents (like Claude) to interact with API Dash collections, environments, and history.

## Configuration

The MCP server needs to know where your API Dash Hive database is located. You can specify this using one of the following methods:


### Default Path

If no path is specified, the server will default to creating and using a `.apidash` directory in your home folder (`~/.apidash`).

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
