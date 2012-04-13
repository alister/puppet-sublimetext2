class sublimetext2::params (
  $ver = '-dev',
  $userName = undef,
  $installBasePath = undef
) {
  case $userName {
    undef: { fail('You must set a sublimetext2::params::userName')
    } 
    default: {  }
  }
}
