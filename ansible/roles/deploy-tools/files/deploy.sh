echo "Step 1: download deploy packages"

declare -a modules=("ansible" "flyway")
VERSION="0.1.0"
WORKDIR="~/work"
if [ -d "$WORKDIR" ];then
	rm -rf "$WORKDIR"
fi

mkdir "$WORKDIR" && cd "$WORKDIR"

ROOTDIR=`pwd`
for m in "${modules[@]}"; do
	echo "download $m"
	curl -u$JFROG_USER:$JFROG_PASS -O "$JFROG_URL_GENERIC/kitchen-deployments/$VERSION/$m-$VERSION.tgz"
	tar xzvf $m-*.tgz
done

echo "Step 2: install with ansible"
cd ansible/envs/dev
./clean.sh
./install.sh

echo "Step 3: provision database with flyway"
echo "Now wait for mysql is up"
sleep 60
cd $ROOTDIR/flyway/development
./provision_database

