{ pkgs, ... }:

{
  home.packages = [
    (pkgs.ticktick.overrideAttrs (oldAttrs: {
      nativeBuildInputs = oldAttrs.nativeBuildInputs ++ [
        pkgs.nodePackages.asar
      ];

      postUnpack = ''
        mkdir -p $out/app
        asar extract $out/opt/TickTick/resources/app.asar $out/app
      '';

      # https://github.com/yazdipour/unlimited-ticktick-windows/issues/12#issuecomment-3172029445
      postPatch = ''
        sed -i \
          -e 's|200===n\.status|n.data.proEndDate="2030-01-01T00:00:00.000+0000";n.data.needSubscribe=false;n.data.freeTrial=true;n.data.pro=true;&|' \
          -e 's|200===i\.status|i.data.proEndDate="2030-01-01T00:00:00.000+0000";i.data.needSubscribe=false;i.freeTrial=true;i.data.pro=true;&|' \
          $out/app/bundler/index.js

        sed -i \
          -e 's|t=arguments\.length>1?arguments\[1]:void 0;|&if(t.data){if(t.data.proEndDate){t.data.proEndDate=e.get("proEndDate");t.data.pro=true;t.data.needSubscribe=false;t.data.subscribeType="trial";}}|' \
          -e 's|e\.exports=function(e,t,n,r,i){|&return;|' \
          $out/app/public/react/static/vendor.*.js
      '';

      preInstall = ''
        asar pack $out/app $out/opt/TickTick/resources/app.asar
        rm -rf $out/app
      '';
    }))
  ];
}
