#!/bin/sh

# Convert LOCATIONS to separate arguments
LOCATIONS_ARGS=""
IFS=',' read -ra LOCATIONS_ARRAY <<< "$LOCATIONS"
for LOCATION in "${LOCATIONS_ARRAY[@]}"; do
    LOCATIONS_ARGS="$LOCATIONS_ARGS -l $LOCATION"
done

# Convert PLACEHOLDERS to separate arguments if defined
PLACEHOLDERS_ARGS=""
if [ -n "$PLACEHOLDERS" ]; then
    IFS=',' read -ra PLACEHOLDERS_ARRAY <<< "$PLACEHOLDERS"
    for PAIR in "${PLACEHOLDERS_ARRAY[@]}"; do
        PLACEHOLDERS_ARGS="$PLACEHOLDERS_ARGS -p $PAIR"
    done
fi

# Convert SCHEMA to separate arguments if defined
SCHEMA_ARGS=""
if [ -n "$SCHEMA" ]; then
    IFS=',' read -ra SCHEMA_ARRAY <<< "$SCHEMA"
    for SCHEMA in "${SCHEMA_ARRAY[@]}"; do
        SCHEMA_ARGS="$SCHEMA_ARGS -s $SCHEMA"
    done
fi

# Add metadata-table argument if defined
METADATA_TABLE_ARG=""
if [ -n "$METADATA_TABLE" ]; then
    METADATA_TABLE_ARG="--metadata-table $METADATA_TABLE"
fi

# Execute the EvolveDB migration command with all arguments
exec dotnet EvolveDB.dll "$DBMS" "$COMMAND" -c "$CONNECTION_STRING" $LOCATIONS_ARGS $SCHEMA_ARGS $PLACEHOLDERS_ARGS $METADATA_TABLE_ARG
