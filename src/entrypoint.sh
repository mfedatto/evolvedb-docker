#!/bin/sh

# Save the original Internal Field Separator (IFS) to restore it later
ORIGINAL_IFS="$IFS"

# Define default separators for different list variables, if not already defined
LIST_ITEM_SEPARATOR="${LIST_ITEM_SEPARATOR:-;}"
LOCATIONS_SEPARATOR="${LOCATIONS_SEPARATOR:-$LIST_ITEM_SEPARATOR}"
PLACEHOLDERS_SEPARATOR="${PLACEHOLDERS_SEPARATOR:-$LIST_ITEM_SEPARATOR}"
SCHEMAS_SEPARATOR="${SCHEMAS_SEPARATOR:-$LIST_ITEM_SEPARATOR}"

# Convert LOCATIONS to separate arguments, prefixing each with "-l"
LOCATIONS_ARGS=""
IFS="$LOCATIONS_SEPARATOR"
for LOCATION in $LOCATIONS; do
    LOCATIONS_ARGS="$LOCATIONS_ARGS -l $LOCATION"
done

# Convert PLACEHOLDERS to separate arguments if PLACEHOLDERS is defined, prefixing each with "-p"
PLACEHOLDERS_ARGS=""
if [ -n "$PLACEHOLDERS" ]; then
    IFS="$PLACEHOLDERS_SEPARATOR"
    for PAIR in $PLACEHOLDERS; do
        PLACEHOLDERS_ARGS="$PLACEHOLDERS_ARGS -p $PAIR"
    done
fi

# Convert SCHEMA to separate arguments if SCHEMA is defined, prefixing each with "-s"
SCHEMA_ARGS=""
if [ -n "$SCHEMA" ]; then
    IFS="$SCHEMAS_SEPARATOR"
    for SCHEMA_ITEM in $SCHEMA; do
        SCHEMA_ARGS="$SCHEMA_ARGS -s $SCHEMA_ITEM"
    done
fi

# Restore the original IFS value
IFS="$ORIGINAL_IFS"

# Add metadata-table argument if METADATA_TABLE is defined
METADATA_TABLE_ARG=""
if [ -n "$METADATA_TABLE" ]; then
    METADATA_TABLE_ARG="--metadata-table $METADATA_TABLE"
fi

# Execute the EvolveDB migration command with all the constructed arguments
exec "/app/evolve_${EVOLVE_VERSION}_Linux-64bit/evolve $COMMAND $DBMS -c $CONNECTION_STRING $LOCATIONS_ARGS $SCHEMA_ARGS $PLACEHOLDERS_ARGS $METADATA_TABLE_ARG"
