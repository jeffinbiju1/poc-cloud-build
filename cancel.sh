PROJECT_ID=cloud-aoss-1p-dev
builds_list=$(gcloud alpha builds runs list --region=us-central1 --project=cloud-aoss-1p-dev)

# Use awk to extract the IDs from the output, skipping the header line
workflow_ids=$(echo "$builds_list" | awk 'NR>1 {print $1}')
# Print the filtered workflow IDs
echo "Filtered Workflow IDs:"
echo "$workflow_ids"
for id in $workflow_ids; do
  gcloud alpha builds runs cancel $id --region=us-central1 --project=${PROJECT_ID}
  echo "Canceled workflow with ID: $id"
done

