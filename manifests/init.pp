#
# Mailops Team
#
# Configure bash

class bash (
  $aliases  = '/root/.bash_aliases',
){
  concat { $aliases:
    ensure  => present,
  }

  concat::fragment { 'bash_aliases_header':
    target  => $aliases,
    source  => "puppet:///modules/${module_name}/bash_aliases_header",
    order   => '01',
  }

  # Append new line at the end the file, this is cute
  concat::fragment { 'bash_aliases_footer':
    target  => $aliases,
    content => "\n",
    order   => '99',
  }

  file { '/root/.bashrc':
    ensure  => present,
    source  => "puppet:///modules/${module_name}/bashrc",
    owner   => 'root',
    group   => 'root',
  }
}
