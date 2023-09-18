{ pkgs }:

{
  terraform = with pkgs; [ terraform ];
  azure = with pkgs; [ azure ];
}
