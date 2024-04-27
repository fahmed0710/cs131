mkdir -p UnitedStates

categories=$(cut -d ',' -f 5 youtubeStats.csv | sort | uniq)

IFS=$'\n'

cat youtubeStats.csv | while read line; do
	country=$(echo "$line" | cut -d ',' -f 8)
	if [ "$country" == "United States" ]; then
		line_cat=$(echo "$line" | cut -d ',' -f 5)
	       	
		IFS=$'\n'	
		
		for category in $categories
		do
			if [ "$line_cat" == "$category" ]; then
				echo "$line" >> UnitedStates/$category.txt
			fi
		done
		
		unset IFS
	fi
done
