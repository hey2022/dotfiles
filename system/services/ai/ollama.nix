_: {
  services.ollama = {
    enable = true;
    loadModels = [
      "deepseek-r1:8b"
      "llama3.1:8b"
      "qwen:7b"
    ];
  };
}
