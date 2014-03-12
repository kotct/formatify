#!/bin/sh

usage ()
{
	usage="Usage: $0 [-v] [options]
YAY, TUBG
"

	printf "%s\n" "$usage"
}

while :
do
	case $1 in
		-h | --help | -\?)
			usage;
			exit 0;
			;;
		-f | --file)
			file=$2;
			shift 2;
			;;
		--file=*)
			file=${1#*=}
			shift 1;
			;;
		-v | --verbose)
			verbose=$((verbose+1))
			shift 1;
			;;
		--)
			shift 1;
			break;
			;;
		-*)
			printf >&2 "Warning: Unknown option ignored: %s\n" "$1"
			shift 1;
			break;
			;;
		*)
			break;
			;;
	esac
done
