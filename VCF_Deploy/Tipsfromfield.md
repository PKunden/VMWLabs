# How to remove the lock, when the task is outdated

I did a restore of vCenter today and found a deployment task is completed, but it kept showing there is another task
This stopped other functions because if the workflow is active, all workflows cannot be start.
SDDC Manager is kind of locked.

Find the deployment lock id: 

psql --host=localhost -U postgres -d platform -c "select * from lock"
Put the iD in this cmd:
psql --host=localhost -U postgres -d platform -c "delete from lock where id='8dfb9471-4626-42c6-ba67-87404b5af576'"

