
EXEC tSQLt.NewTestClass 'PlayerankTests';
GO

CREATE PROCEDURE PlayerankTests.TestSameRow  -- This test fails!!
AS
BEGIN
    INSERT INTO Player VALUES (1, GETDATE(), 3);
    DECLARE @result INT
    SET @result = (SELECT dbo.ComparePlayers(1, 1));
    EXEC tSQLt.AssertEquals 1, @result;
END;
GO





EXEC tSQLt.RunAll;
