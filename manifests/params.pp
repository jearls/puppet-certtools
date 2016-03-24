# Class: certtools::params
# ===========================
#
# Defines parameter defaults and OS-specific settings for certtools.
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

class certtools::params {

# each optional parameter in certtools should be given a
# default value here.  other OS-specific settings may also be defined
# here, to be used in certtools and other subclasses.

  $param = 'default'

}
