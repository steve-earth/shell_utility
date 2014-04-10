cd YOUR_WORK_PATH
path=`pwd`

ls | while read folder; do
	echo "******* start process folder $folder *******"
	cd $path/$folder
	
	if [ ! -e thumbnail ]; then
		mkdir thumbnail
	fi

	ls | while read line; do
		if [ -f $line ]; then
			#get file extension
			ex=${line#*.}

			if [ $ex == "jpg" ]; then
				#get file extension
				convert -define jpeg:size=200x200 $line  -thumbnail 200x200^ -gravity center -extent 200x200  thumbnail/thumb_$line
			fi
		fi
	done

	echo "******* folder $folder processed *******"
done