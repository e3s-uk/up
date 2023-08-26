mkdir wis2box-data
git clone https://github.com/wmo-im/wis2box

cp wis2box/examples/config/wis2box.env wis2box/dev.env

# Ensure passwords are >= 8 chars else containers may not start
sed -i '/^WIS2BOX_BROKER_PASSWORD/c\WIS2BOX_BROKER_PASSWORD=abcd1234!' dev.env
sed -i '/^WIS2BOX_STORAGE_PASSWORD/c\WIS2BOX_STORAGE_PASSWORD=abcd1234!' dev.env
sed -i "/^WIS2BOX_HOST_DATADIR/c\WIS2BOX_HOST_DATADIR=$(pwd)/wis2box-data" dev.env

cp wis2box/examples/config/synop-bufr-mappings.yml wis2box-data/data-mappings.yml
# TODO:
# - Replace country with your corresponding ISO 3166 alpha-3 country code in lowercase
# - Replace centre_id with the string identifying the centre running your wis2node in lowercase, alphanumeric characters

mkdir -p wis2box-data/metadata/station
cp wis2box/examples/config/station_list.csv wis2box-data/metadata/station
cp wis2box/examples/config/surface-weather-observations.yml wis2box-data/metadata/station

echo "Within the wis2box directory, you can now use commands like:"
echo "  python3 wis2box-ctl.py start"
echo "  python3 wis2box-ctl.py status"
