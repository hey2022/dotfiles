function main(config) {
  const group = config["proxy-groups"].map((group) => group.name)[0];
  config.rules = config.rules.map((rule) =>
    rule.replace(/,PROXY$/, "," + group),
  );
  return config;
}
