{ pkgs }:

{
  aws = with pkgs; [ awscli2 ];
  azure = with pkgs; [ azure-cli ];
  terraform = with pkgs; [ terraform ];
}
