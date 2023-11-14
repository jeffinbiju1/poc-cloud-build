
#!/bin/bash
names=$(cat irrbuildinfos)
PROJECT_ID="cloud-aoss-1p-dev"
rm irrmapping.txt
for name in $names; do
	echo $name
	output=$(gcloud alpha builds workflows run irr --region=us-central1 --project=${PROJECT_ID} --params="buildinfo=${name}" 2>&1)
	url=$(echo "$output" | grep -o 'https://console.cloud.google.com/cloud-build/runs/[^\ ]*')
	echo $name >> irrmapping.txt
       	echo $url >> irrmapping.txt	
	#echo $output
done
