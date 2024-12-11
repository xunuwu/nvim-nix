{
  extraFiles."after/ftplugin/rust.lua".source = ./config.lua;

  plugins.rustaceanvim = {
    enable = true;
    rustAnalyzerPackage = null;
  };
}
