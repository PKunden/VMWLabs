# VCF Script to delete the lock on the postgre database
psql --host=localhost -U postgres -d platform -c "select * from lock"
Put the iD in this cmd:
psql --host=localhost -U postgres -d platform -c "delete from lock where id='6c37b751-aca2-49a3-a4c7-9d391e72a9d4'"
