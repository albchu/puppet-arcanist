# == Class: arcanist
#
# This module manages and sets up arcanist on a node machine.
#
# === Parameters
#
# [*install_dir*]
#   Specifies where arcanist and all its dependencies will be installed to.
#   Directory must exist prior to arcanist install to that directory
#   Default: '/opt/arcanist'
#
#  [*arcanist_repo*]
#    Specifies where to download the arcanist repo from
#    Default: 'git://github.com/phacility/arcanist.git'
#
#  [*libphutil_repo*]
#    Specifies where to download the libphutil repo from. It is a dependency that arcanist relies on
#    Default: 'git://github.com/phacility/arcanist.git'
#
# === Examples
#
#  class { 'arcanist':
#    install_dir => '/home/achu/arcanist',
#  }
#
# === Authors
#
# Author Name <albert.chu@synopsys.com>
#
# === Copyright
#
# Copyright 2015 Synopsys
#
class arcanist (
  $install_dir = $arcanist::params::install_dir,
  $arcanist_repo = $arcanist::params::$arcanist_repo,
  $libphutil_repo = $arcanist::params::$libphutil_repo

) inherits arcanist::params
{
  vscrepo { "$install_dir/arcanist" :
    ensure    =>  present,
    provider  =>  git,
    source    => $arcanist_repo
  }
  vscrepo { "$install_dir/libphutil" :
    ensure    =>  present,
    provider  =>  git,
    source    => $arcanist_repo
  }
}

