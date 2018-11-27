for filename in $1/*.RRF; do
	sed -i -e 's/\\/\\\\/g' "$filename";
	echo "ESCAPE DONE FOR: $filename";
done
