function main(config) {
  const selectedGroup = config["proxy-groups"].reduce((a, b) =>
    a.proxies.length + 5 >= b.proxies.length ? a : b,
  ).name;
  config.rules = config.rules.map((rule) =>
    rule.replace(/,PROXY$/, "," + selectedGroup),
  );
  return config;
}
