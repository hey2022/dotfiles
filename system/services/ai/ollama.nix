{...}: {
  services.ollama = {
    enable = true;
    loadModels = ["deepseek-r1:7b" "llama3.1:8b" "qwen:7b"];
  };
}
