#
# Mailops Team
#
# Alias for bash
#

define bash::alias (
  $content  = undef,
){
  if $content {
    concat::fragment { "bash_aliases_${name}":
      target  => $::bash::aliases,
      content => "\nalias ${name}='${content}'",
      order   => '10',
    }
  }
  else {
    fail("Missing content, cannot set bash::alias ${name}")
  }
}
