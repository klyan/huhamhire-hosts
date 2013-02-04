#!/bin/sh

# Shell script to generate hosts files
# author: Weihong Guan (@aGuegu)

cat info.hosts timestamp.hosts localhost.hosts > tmp/header.hosts.tmp

for folder in $(ls -d *_mods)
do
#	echo $folder

	>tmp/$folder.hosts.tmp
	for file in $(ls $folder/)
	do
		cat $folder/$file >> tmp/$folder.hosts.tmp
	done
done

cat tmp/header.hosts.tmp tmp/share_mods.hosts.tmp tmp/ipv4_mods.hosts.tmp > tmp/main_ipv4.hosts
cat tmp/header.hosts.tmp tmp/share_mods.hosts.tmp tmp/ipv6_mods.hosts.tmp > tmp/main_ipv6.hosts

rm tmp/*.tmp