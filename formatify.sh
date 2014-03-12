#!/bin/sh

while getopts a:b:c flag;
do
	case $flag in
		a)
			echo "-a used: $OPTARG";
			;;
		b)
			echo "-b used: $OPTARG";
			;;
		c)
			echo "-c used";
			;;
		?)
			exit;
			;;
	esac
done

shift $((OPTIND - 1))
