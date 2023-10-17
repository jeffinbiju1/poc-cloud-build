
#!/bin/bash
pkgs=$(head -150 pkgs)
PROJECT_ID="cloud-aoss-1p-dev"
rm mapping.txt
for pack in $pkgs; do
	echo $pack
	gcloud alpha builds workflows apply --file=wf-debian.yaml --region=us-central1 --project=${PROJECT_ID}
	output=$(gcloud alpha builds workflows run debian --region=us-central1 --project=${PROJECT_ID} --params="pkg=${pack}" 2>&1)
	url=$(echo "$output" | grep -o 'https://console.cloud.google.com/cloud-build/runs/[^\ ]*')
	echo $pack >> mapping.txt
       	echo $url >> mapping.txt	
	#echo $output
done
