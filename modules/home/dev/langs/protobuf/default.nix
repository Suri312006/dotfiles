{ pkgs, ... }: {
  home.packages = with pkgs; [
    protobuf_27
    protoc-gen-go
    protoc-gen-go-grpc
  ];

}
