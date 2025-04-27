{
  config,
  pkgs,
  ...
}: {
  xdg.configFile."vkBasalt/vkBasalt.conf".text = ''
    effects = LiftGammaGain

    reshadeIncludePath = ${config.home.homeDirectory}/.local/share/gamescope/reshade/Shaders

    LiftGammaGain = ${config.home.homeDirectory}/.local/share/gamescope/reshade/Shaders/LiftGammaGain.fx
  '';
  home.file.".local/share/vulkan/implicit_layer.d/vkBasalt.json".source = "${pkgs.vkbasalt}/share/vulkan/implicit_layer.d/vkBasalt.json";
  home.file.".local/lib/libvkbasalt.so".source = "${pkgs.vkbasalt}/lib/libvkbasalt.so";
}
