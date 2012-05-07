#
# plugins won't install till after it has been run, & created the config dir.
#
# Add a define to allow installing SUBLIME-TEXT-2 packages from a git repo
define sublimetext2::plugin (
  $gitUrl,
  $pluginName = $title
) {
  include sublimetext2::params
  include sublimetext2::packages

  exec { "sublime-package-${pluginName}":
    command => "/usr/bin/git clone $gitUrl $pluginName",
    creates => "${sublimetext2::params::installBasePath}/${pluginName}/",
    cwd     => $sublimetext2::params::installBasePath,
    user    => $sublimetext2::params::userName,
    require => Class['sublimetext2::packages'],
    onlyif  => "[ -d ${sublimetext2::params::installBasePath} ]",
  }
}
