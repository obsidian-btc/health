This is used to provide a Health Check HTTP endpoint

1- Each project should have a particular endpoint(s), they should not overlap
so that mulitple services running on a single node will not confuse our
operations

2- If you pass a block to the build method, that code will be evaluated and
merged into the check.  The return type of that block should be a hash

