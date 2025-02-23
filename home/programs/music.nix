{pkgs, ...}: {
  home.packages = with pkgs; [
    (supersonic-wayland.overrideAttrs (old: {
      version = "git";
      src = fetchFromGitHub {
        owner = "dweymouth";
        repo = "supersonic";
        rev = "adf6d7c324b87e863ff8ae684ac1c6cfcb6227c6";
        hash = "sha256-ua2INyKPncXDOwzmKrgnRCb7q8CFEApEaYuBbQeau98=";
      };
      vendorHash = "sha256-5LxYD9kLUvKgXmDCw1SNBM6ay8Vayj+PyoZRVptSM0c=";
    }))
  ];
}
