-- PLAYER RANKING Ranking SETUP SCRIPT
-- ====================

-- Please execute each of the 6 steps separately.


-- 1. Execute to get started
EXEC sp_configure 'clr enabled', 1;
RECONFIGURE;
CREATE DATABASE playerank;
GO
ALTER DATABASE [playerank] SET TRUSTWORTHY ON;
GO

-- 2. Load in the testing framework 
--   (execute the following in a shell prompt)
--   sqlcmd -S localhost -d playerank -U <USER> -P <PWD> -i ./lib/tSQLt.class.sql

-- 3. Prepare testing framework
EXEC playerank.tSQLt.InstallExternalAccessKey;
EXEC master.sys.sp_executesql N'GRANT UNSAFE ASSEMBLY TO [tSQLtExternalAccessKey];';

-- 4. Clean up the setup.
ALTER DATABASE [playerank] SET TRUSTWORTHY OFF;

-- 5. Execute the Pleyer Ranking program
--   (execute the following in a shell prompt)
--   sqlcmd -S localhost -d playerank -U <USER> -P <PWD> -i ./playerank.sql

-- 6. Now you are ready to run the tests!
--    You can find a starter in "tests.sql"

