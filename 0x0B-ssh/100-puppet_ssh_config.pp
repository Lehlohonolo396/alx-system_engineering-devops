#!/usr/bin/env bash
# Using puppet to connect without password

# define the type of file

file { '/etc/ssh/ssh_config':

  # ensure file exists before anything further
  ensure => present,
}

file_line { 'Turn off passwd auth':

  # specifies the path of the file being modified.
  path    => '/etc/ssh/ssh_config',

  # defines line to be modified
  line    => 'PasswordAuthentication no',

  # specifies regular expression to match existing line before modifying it.
  match   => '^#PasswordAuthentication',
}

file_line { 'Declare identity file':

  # specifies path to the file being modified.
  path    => '/etc/ssh/ssh_config',

  # defines line to be modified
  line    => 'IdentityFile ~/.ssh/school',

  # specifies regular expression to match existing line before modifying it.
  match   => '^#IdentityFile',
}
