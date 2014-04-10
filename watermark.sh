cd YOUR_WORK_PATH
path=`pwd`
watermark_filt_path=WATERMARK_IMAGE_PATH
ls | while read folder_name; do
	echo ""
	echo "******* start process folder $line *******"
	echo ""
	cd $path/$folder_name

	if [ ! -e watermark ]; then
		mkdir watermark
	fi
	ls | while read line; do
		if [ -f $line ]; then
			ex=${line#*.}
			if [ $ex == "JPG" ] || [ $ex == "jpg" ]; then
				echo "composite picture $line";
				composite -gravity center -quality 100 $watermark_filt_path $line watermark/$line
			fi
		fi
	done
done