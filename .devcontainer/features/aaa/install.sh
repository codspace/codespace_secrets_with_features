#!/bin/bash

echo "Installing 'aaa'"

tee /usr/local/share/featureA.sh > /dev/null \
<< 'EOF'
#!/bin/sh

set -e

echo "Running '/usr/local/share/featureA.sh' !"

echo "MY_SECRET is......... $MY_SECRET"

echo "$MY_SECRET" > /tmp/this-file-was-written-from-the-entrypoint-`date +%s`.txt

# Execute whatever commands were passed in (if any). This allows us
# to set this script to ENTRYPOINT while still executing the default CMD.
exec "$@"

EOF

echo "Done!"