# https://stackoverflow.com/questions/135688/setting-environment-variables-in-os-x#answer-32405815

grep export $HOME/.exports-private | while IFS=' =' read ignoreexport envvar ignorevalue; do
  launchctl setenv ${envvar} ${!envvar}
done
