{ inputs, ... }:

{
  home.file = {
    ".agents/skills/janestreet".source = inputs.janestreet-agent-skills;
  };
}
