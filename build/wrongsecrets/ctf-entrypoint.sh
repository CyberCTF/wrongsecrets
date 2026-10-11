#!/bin/sh
# CyberCTF per-player key, added by the overlay (the vendored source in app/ is unchanged).
# In CTF mode WrongSecrets answers every solved challenge with a code, HMAC-SHA1(ctf_key,
# challenge name). At every start this wrapper takes the player's key (CTF_FLAG_CTF_KEY, given
# by the launcher; else upstream's default ctf_key, the development key) and hands it to the app
# with ctf_enabled=true in a properties file Spring loads on top of its own, then starts the app
# exactly as before. The key goes in a file, not the environment: challenge 60's MCP server
# shows the process environment to players.
dev='TRwzkRJnHOTckssAeyJbysWgP!Qc2T'
key=${CTF_FLAG_CTF_KEY:-$dev}
unset CTF_FLAG_CTF_KEY
dir=/tmp/ctf
mkdir -p "$dir" && chmod 700 "$dir"
umask 077
{
  printf 'ctf_enabled=true\n'
  printf 'ctf_key=%s\n' "$(printf '%s' "$key" | sed 's/\\/\\\\/g')"
} > "$dir/ctf.properties"
export SPRING_CONFIG_ADDITIONALLOCATION="file:$dir/ctf.properties"
exec "$@"
