class Zdotdir < Formula
  desc "Personal Zsh configuration"
  GITHUB_USER = GitHub.user["login"]
  homepage "https://github.com/#{GITHUB_USER}/#{name.demodulize.downcase}#readme"
  # version "latest"
  license "MIT"
  latest = homepage.sub "#readme", ".git"
  head latest, branch: "main"

  # livecheck do
    # url :stable
    # regex /TODO/
  # end

  # depends_on "subversion" => :build
  uses_from_macos "zsh"

  def install
    doc.install_metafiles
    prefix.install Dir[".z*", "*/"]
  end

  def post_install
    plist = launchd_service_path.sub opt_prefix, prefix
    hash = Plist.parse_xml plist
    hash["WatchPaths"] = %W[#{opt_prefix}/.zshenv #{opt_prefix}/.zshenv.zwc]
    File.write plist, hash.to_plist
  end

  def caveats
    <<~EOS
      TODO, in your Brewfile:
        brew "#{name}", restart_service: :changed
    EOS
  end

  service do
    # run ["launchctl", "setenv", @formula.name.upcase, opt_prefix]
    run [ENV["SHELL"], "-c", "launchctl setenv #{@formula.name.upcase} #{opt_prefix}"] #[opt_bin/
    keep_alive path: opt_prefix #{opt_prefix}/.zshenv.zwc" #true #network_state: true
    # ["#{opt_prefix}/.zshenv", "#{opt_prefix}/.zshenv.zwc"] FIXME
    # environment_variables @formula.name.upcase => opt_prefix #, PATH: std_service_path_env

    #require_root true

    # watch_paths %W[#{opt_prefix}/.zshenv #{opt_prefix}/.zshenv.zwc] FIXME: PR

    log = HOMEBREW_LOGS/"#{@formula.name}.log" #.sub Dir.home, "~" #var/"log/#{@formula.name}.log"
    log_path log
    error_log_path log
  end

  test do
    ENV["ZDOTDIR"] = testpath #opt_prefix
    touch ".zshenv"
    #(testpath/".zshenv").write "HOMEBREW_TEST_#{name.upcase}=test"
    sourced = shell_output "zsh --source-trace -c exec 2>&1"
    assert_match "#{testpath}/.zshenv", sourced #{opt_prefix}/
  end
end
