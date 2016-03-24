# Class: certtools
# ===========================
#
# Full description of class certtools here.
#
# Parameters
# ----------
#
# Document parameters here.
#
# * `sample parameter`
# Explanation of what this parameter affects and what it defaults to.
# e.g. "Specify one or more upstream ntp servers as an array."
#
# Examples
# --------
#
# @example
#    class { 'certtools':
#      param => ...
#    }
#
# Authors
# -------
#
# Johnson Earls <johnson.earls@gmail.com>
#
# Copyright
# ---------
#
# Copyright 2016, Johnson Earls
#

class certtools (
# first, include any required paramaters (those without defaults)
  $req_param_1 ,
  $req_param_2 ,
# followed by any optional parameters (those with defaults).
# the default values should be defined in the certtools::params class.
  $opt_param_1 = $certtools::params::opt_param_1 ,
  $opt_param_2 = $certtools::params::opt_param_2 ,
) inherits certtools::params {
}
