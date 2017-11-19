<h1>Seek And Hit Tasks</h1>

<p>Tasks done for company Seek and Hit to demonstrate programming experience</p>

<h3>1. Toy Robot</h3>

<p>
Key Technology : PHP<br>
Framework used for testing : PHPUnit
</p>

<h4>Results</h4>

<p>Results of the given parameters are shown in index.php file inside the folder php_task_sah</p>

<h4>Tests</h4>

<p>To test the code of an application use command 'phpunit tests/' in root of an aplication inside command line tool</p>

<h3>2. PostgreSQL - CrewDatabase</h3>

<p> SQL Code can be found in database_task_sah.sql with some test data and queries.</p>

<h3>3. Redis | Lua </h3>

<p>Lua script that will be used within redis can be found inside redis_lua_task_sah.lua file</p>

To make it work assign parking spaces that are not used<br>
<b>rpush p_id 10 9 8 7 6 5 4 3 2 1</b><br>
Than using command prompt call the script<br>
<b>redis-cli -h hostname -p portname --eval redis_lua_task_sah.lua airplane:number</b>



