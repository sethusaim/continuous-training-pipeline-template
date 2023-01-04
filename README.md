# Continuous Training Template using on demand self hosted AWS EC2 runners

This is a template for running continuous training pipeline in EC2 instances dynamically using Github Actions

## Notes -
There are different ways in which you can trigger the continuous training pipeline, some of them are mentioned below

1. To trigger the continuous training pipeline from external triggers, we need to use this command

```bash
curl -X POST -H "Accept: application/vnd.github+json" \
  -H "Authorization: Bearer <YOUR-TOKEN>"\
  -H "X-GitHub-Api-Version: 2022-11-28" \
  https://api.github.com/repos/OWNER/REPO/dispatches \
  -d '{"event_type":"continuous-training","client_payload":{"unit":false,"integration":true}}'
```
2. To trigger the continuous training pipeline manually, we have used "workflow_dispatch" as the event type to trigger the workflow, this essentially creates a button in the actions page of your repo, by clicking that button we can trigger the worflow manually, or else we can use cron job to run our pipelines based on the schedule 

[ Note - I have not used cron job in my workflow ], but if you want to use that in the workflow 

```bash
on:
  schedule:
    - cron: '30 5,17 * * *'
```
We can change the cron expression accordingly

# Credits and References 
1. https://github.com/machulav/ec2-github-runner